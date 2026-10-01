Received: from mail-qk2-f38.google.com (mail-qk2-f38.google.com [74.125.230.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA6F3BF689
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 19:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790882359; cv=none; b=uoME3VvSZJ3a8SgTHx3gh1lxmyNPhZhhavbh0uC0IaVI9QrBsqJXgF9NeuPgl8PfW4G2Vve6nhUIFBaoqZC8AEBZ312OShimzsZJ+xaDaAr0W6O9dDUZtutmbNrRGw3+dGbpkVqXxW80iSQj4wsh4Sefl/lxf17T33OgzIsss/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790882359; c=relaxed/simple;
	bh=fO68JDy7h2mkSC3wXOiTOR3KYoEnokUrbzSoIUOfMVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=acGxDjJqE0So28yPzRRyt2862ssO6s56wax23S+AWm6S593MKVIK4eg+4kazG9MOfmP3CdfCTMvHmS6GVglNxh1Tg5STD5ORatuoKcLai98fA/fUbpzUnEmfcmCY9i4EfCOYC3slGpDXJIbtkbgRLlbb8kXvkcWIleY4NoL6GJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=quVvXwwj; arc=none smtp.client-ip=74.125.230.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="quVvXwwj"
Received: by mail-qk2-f38.google.com with SMTP id d75a77b69052e-5339b4a29f9so851031cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 12:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790882356; x=1791487156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H5ABqliwt/0HVQecrzmM2IfcVofZb65+VwqbBeb7yHg=;
        b=quVvXwwj5ePkH9anmrBdM2truSpmQi7t4poj2NJ0fWi2kvwmLENF1dBP4YPkrB4FiY
         hArb4hcdczVEl2ZTEfDw+chea5oxgc4s8C1u/HTWim1ZCyS5QEI+woE2s4HO5zGe4Dfw
         0j/9h+4LuuIac/tRDmhrrC8adSEa3V0D8mMoYamHS6blSYXFsZCM/49Sz91EwBBLaAAt
         FCwTSWFsJUDBeALpniCC46ClkLUcyqQOp+Q3fMm4zy4FpSAhyKsQR8um0I2yEWyzF+t3
         o4Zw9YpqnGE9QfdCRwDj0Y7paJCLaAQl1FBhZ9X1NFU02lC/4tI2osQTLPMO0gUJwhK7
         Ktiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790882356; x=1791487156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H5ABqliwt/0HVQecrzmM2IfcVofZb65+VwqbBeb7yHg=;
        b=H6HCMAP45qV+e7A7Wd2IcrWVRrTthIOCaHeQBXVPaMBtPuSHl9/MoUZbGY4S/y7XvC
         1gRYNCva8ywY1Vuk/s5r+CpRL3jRVEPgzyilWV2cjs4wRDx0CSVjxhdbjfJIQcQTX5Hp
         bDbiFTje/9QHYwPBeTANGSEkIRfIsW3dcIAsev8Jr9jY1a5Yk3dbJPGiEjUXeKm4xTKq
         SS7T8Ebh+f1XIVXbRIVHnysVrdTgIKmpxuIoRuinkpf4hBm93b25C/Os8BNib53Q3KiA
         9Gn65R1wB8W3bAbbzcPlsYgGoF3OL8ej+9F+Q6PEiC2zg0WrhybV3uBOnSJ9AARGgPX6
         6Omw==
X-Forwarded-Encrypted: i=1; AKwUvBxocWHULhlt7ss2S/jFoqZWHZAjgMn78BZN++v6sVVVF+affNjNk9e7EvBmILKO47qG6dLp/d/QLGqNmb0N@vger.kernel.org
X-Gm-Message-State: AFuF++npqyMTom7dDtykf471w3YKBDWLek53UH889xvDxPaJSH2bvW6z
	l+4S4Jous1EfZPcP3q63qF/0SCfoITX/Wkibujmly4jheZo8NqOOaF+oQSlgY34lQ7s=
X-Gm-Gg: AYBFou3iQezg/FsRd8/ECXN6WXIzpsVXFSUjZkbNY94U1n9qSm4yotmFthAlu9GwWpg
	K7NMOvdl+FYuQVYaHLjd7Di/Y3BF8a26ywaY284v4IdTXTiLFkYnTeWyfMecY0uVEQkMxfFewlw
	YrSuhDozwptYER9OkgttwU3PpKwa40Jom1nZHl/YKxBe4F9z3tbHFr57ChvPFSZi7dsF+BtzxZF
	BQWD9lNcFLPZ/c2feqKDi6eCaUZHRi7NUmnqBobqzQ4UJHwk9OdAl+zaClusgasbiOXn4H7zvIw
	YqZL4HM4g+XG2E4z7aMi+4p3JOMfNCnLCRCoKQD7bjEAD+0Wm/7fScCyqPIgTixlg8blNFf/BPs
	FlltUO/Jgz7GLIhEG6tBYbphjNiXGnOBsbJSh/+2YE6xzf0XaC+LDvzG8xmwgRzv9QQscaKpDbI
	W/svHW3swUEGfe5jCfTj6kk2lSCCTi9kZOWUozI2wSwainq7Kmtyb3mFnKQAJH7DQpE8hgXo8=
X-Received: by 2002:a05:622a:4296:b0:533:3fc2:8b19 with SMTP id d75a77b69052e-533cba5b5b6mr2082701cf.20.1790882356405;
        Thu, 01 Oct 2026 12:19:16 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398bf8196sm5954131cf.22.2026.10.01.12.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 12:19:16 -0700 (PDT)
Message-ID: <9c426950-b3f3-42fd-b31d-f14085a7d2d1@riscstar.com>
Date: Thu, 1 Oct 2026 14:19:14 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add endpoint
 buses
To: Greg KH <gregkh@linuxfoundation.org>, andersson@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, arnd@arndb.de,
 bhelgaas@google.com, abelvesa@kernel.org, daniel@riscstar.com,
 mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260918152659.413268-1-elder@riscstar.com>
 <20260918152659.413268-4-elder@riscstar.com>
 <2026100159-retold-could-3468@gregkh>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <2026100159-retold-could-3468@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/26 7:06 AM, Greg KH wrote:
> On Fri, Sep 18, 2026 at 10:26:58AM -0500, Alex Elder wrote:
>> The TC9564 SoC incorporates a PCIe switch, which is connected via
>> the second PCI segment (0001) on the RB3gen2 platform.  The third
>> downstream port of that switch (pcie@3,0) has an embedded PCIe
>> endpoint that implements two PCIe functions.
>>
>> The SoC implements other peripherals, and they will be accessed via
>> PCI endpoint bus.  Define the devicetree nodes representing these
>> buses, including the mapping of each BAR's address range to its
>> local address space.
>>
>> The endpoint's ranges property must be defined, but it will be
>> updated dynamically to include all BARs.  As a result of this update,
>> the parent address portion of each range will reflect the specific
>> address assigned to the BAR.
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 30 ++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 3bb5fca8e2b13..5b7f5292a8864 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -955,11 +955,41 @@ pcie@3,0 {
>>   			bus-range = <0x5 0xff>;
>>   
>>   			dev@0,0 {
>> +				compatible = "pci1179,0220";
>>   				reg = <0x50000 0x0 0x0 0x0 0x0>;
>> +				#address-cells = <3>;
>> +				#size-cells = <2>;
>> +				/* Ranges will be updated dynamically */
>> +				ranges = <0x0 0x0 0x0  0x83050000 0x0 0x0  0x0 0x4000>,
>> +					 <0x2 0x0 0x0  0x83050000 0x0 0x4000  0x0 0x80000>,
>> +					 <0x4 0x0 0x0  0x83050000 0x0 0x84000  0x0 0x200000>;
>> +
>> +				pci-ep-bus@4 {
>> +					compatible = "simple-bus";
>> +					#address-cells = <1>;
>> +					#size-cells = <1>;
>> +					/* Map 0x0-0x1fffff to BAR 4 */
>> +					ranges = <0x0  0x4 0x0 0x0  0x200000>;
>> +				};
>>   			};
>>   
>>   			dev@0,1 {
>> +				compatible = "pci1179,0220";
>>   				reg = <0x50100 0x0 0x0 0x0 0x0>;
>> +				#address-cells = <3>;
>> +				#size-cells = <2>;
>> +				/* Ranges will be updated dynamically */
>> +				ranges = <0x0 0x0 0x0  0x83050100 0x0 0x0  0x0 0x4000>,
>> +					 <0x2 0x0 0x0  0x83050100 0x0 0x4000  0x0 0x80000>,
>> +					 <0x4 0x0 0x0  0x83050100 0x0 0x84000  0x0 0x200000>;
>> +
>> +				pci-ep-bus@4 {
>> +					compatible = "simple-bus";
>> +					#address-cells = <1>;
>> +					#size-cells = <1>;
>> +					/* Map 0x0-0x1fffff to BAR 4 */
>> +					ranges = <0x0  0x4 0x0 0x0  0x200000>;
>> +				};
>>   			};
>>   		};
>>   	};
>> -- 
>> 2.53.0
>>
> 
> This doesn't apply to the char-misc-testing branch :(

Sorry about that.  It does apply to to the for-next branch for
Qualcomm, so this should probably get merged through that path.

https://lore.kernel.org/lkml/20260918152659.413268-1-elder@riscstar.com/

> So I took the first two patches only.

Thank you.

					-Alex

> thanks,
> 
> greg k-h

