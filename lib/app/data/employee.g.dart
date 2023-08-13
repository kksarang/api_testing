// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeAdapter extends TypeAdapter<Employee> {
  @override
  final int typeId = 0;

  @override
  Employee read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Employee(
      id: fields[0] as int?,
      name: fields[2] as String?,
      username: fields[3] as String?,
      email: fields[4] as String?,
      profileImage: fields[5] as String?,
      address: fields[6] as Address?,
      phone: fields[7] as dynamic,
      website: fields[8] as String?,
      company: fields[9] as Company?,
    );
  }

  @override
  void write(BinaryWriter writer, Employee obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.profileImage)
      ..writeByte(6)
      ..write(obj.address)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.website)
      ..writeByte(9)
      ..write(obj.company);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is EmployeeAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

class CompanyAdapter extends TypeAdapter<Company> {
  @override
  final int typeId = 1;

  @override
  Company read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Company(
      name: fields[0] as String?,
      catchPhrase: fields[1] as String?,
      bs: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Company obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.catchPhrase)
      ..writeByte(2)
      ..write(obj.bs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CompanyAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final int typeId = 2;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address(
      street: fields[0] as String?,
      suite: fields[1] as String?,
      city: fields[2] as String?,
      zipcode: fields[3] as String?,
      geo: fields[4] as Geo?,
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.street)
      ..writeByte(1)
      ..write(obj.suite)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.zipcode)
      ..writeByte(4)
      ..write(obj.geo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AddressAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

class GeoAdapter extends TypeAdapter<Geo> {
  @override
  final int typeId = 3;

  @override
  Geo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Geo(
      lat: fields[0] as String?,
      lng: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Geo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lng);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is GeoAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
