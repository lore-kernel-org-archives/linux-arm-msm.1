Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999965;
	b=I6srkMXB6JENq3eV1nnLQWEyTIThoqc/M5OI1AxJG5XRaGnWHtrp2e2TdEhOQXDHSwCh
	 jn7BN7l+Bjfb+NNeFWREuSM1w/YwyhZnTyxhdGvBcgv2OvDvRCTcnOplmc01oJCgNGKyu
	 YpeDR/KsuePusLHXLRP7Ed8ffe7gV3XEyGQ09UxZ53Rng2UJ8aKCaKnNT4cTXDbTBX9Dq
	 crX7pUbJhpG280m+OvOTZiwJgAlIEYTLzEFfHlL7F/c0bqZcUt98vyFCOpAJyjqxdLds2
	 MdeLmBoQ/e3gVJTt10XeYL5tctDjm1+KrbMq4JLfwnFsYp3Sef0E1kvh4SgqBygX+mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999965;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W6pd7EU4elLsb2y8Q71KyuCpGffI4PpHwT4j0EhTH1c=;
	b=MPDmXWyS0rTvpaf3AWlSCWc2wqNNPyIKwu2Knt4w2ckkt4wWW3VrppEheGEiavYqEnI4
	 rB+TFep1iJHLmRSFpMh+ddOjOiogP72swyOvL2vGQQdt4N1+BhUJT+kg6A/5bXQHy8tSM
	 bPnY+DlYHHWOX1eTXPy7NnBQ9I6VSHKcE9hFqQJ0RFczuKrD/iH+7RyqM6h6m5Zv1fGCa
	 /1eMhasURoybya0os0Y0we1swn0wSrbONw4N13zrSroXt/CJJKhsP2YRKirhDivq7JX3E
	 sHJ4dfmBYDUhQeuGiyz6kjN/l47uZOGIceJRm8mEXuPoMEVzxr9XpA+KJ5WsdQhrhGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzSS0hsU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d37F2i1H;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3494606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 11:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3494606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzSS0hsU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d37F2i1H
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9kLmw4082587
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 11:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W6pd7EU4elLsb2y8Q71KyuCpGffI4PpHwT4j0EhTH1c=; b=fzSS0hsUC/3DwuAb
	iryzlyAcSdMaZ7NzmnCtdiEVP4IjjIanKOLfyiBq4s/Y8LRRqEFU0Gg/BbAc7/zB
	cdNEnPM1eMRw6gGkNHEVNosnDPqp16tznAfp5rNon3mXH6QsMpvoXqKVEXgelTZK
	TB/bdjNvFEPKbr0e9R1AXiLvPxis2kAPXwEVtMzLWBZoN3IfEhOdGu5b1VKVF9t8
	7MknCtyhgs/Q2w5BLhvsDXIa2cXXf6rppoNiOKZ2xX4TTRTvE4pFW6yhqGAWXF8G
	h4KAo1oKxy668MOpN25r4FFjWhOR8PRgV9xFBDN9gZVaSJEZKMYJUiFtARUDGHv1
	f5renQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9jnpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 11:06:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb86c39250so622025a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 03:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794999962; x=1795604762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6pd7EU4elLsb2y8Q71KyuCpGffI4PpHwT4j0EhTH1c=;
        b=d37F2i1HHN4vWbrq78O4WNI6zcuP6S1Xb4+VhjxCCFalCGh9l7SOokKK7XG+Eu1CTB
         QX45CcEYS4tmo8HLXhBIRsyKfP2A+u755QM+ArHNizSR0qAD2UpHIxjs48TtOWMlQG9P
         PUu1bY1H2XD+CNUxqSoYHkOhCq/Qa/li1qgAj6jqfvoMbSXX4CrYihdFeNXy/u2OHFAC
         aj1oZp3264ENhok3d3LEd1/1dSY8DtjhwO6AkkMXl+9Wh2cEgHPRZ4622znA5sE4HIE7
         k1xYoLCCVsrIiQX4UpQrr7VbVu7ij2K0Hwzzi5OsX9rKX/p2i5miHT94tP5x9HeMKIm6
         HDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999962; x=1795604762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W6pd7EU4elLsb2y8Q71KyuCpGffI4PpHwT4j0EhTH1c=;
        b=w00EX71XlDDdxUhuK1pPW2H61p4XDO1hrIJkVSx9T8VFWYN9sM24oHKkA1l6Y+0UNp
         mcfU83++h0/jld1HEiRrHdXYijUaxOtG8CgbzQNey7z6Y6j4FcgIDaBdnWkPD+U763ys
         w5aCK+VrcA7/XcQeGOU+UuuMaPeGEXc7UyR+7ocPSLy6XMcNNERDlXQpY5PcvtAZ4n6p
         9UEESh5JHECHTvEIV1YGbT4w1g+AzF3C0knG+pi8/paqunqcWjwo+rUQ047bspHGp5UA
         fKxtycHTt4gI+deWzTUM0/PFrhGImQBT2V8yBWRBNItQ74uJ2Q1b378YFj7IMp4daUeZ
         pnfQ==
X-Forwarded-Encrypted: i=1; AL+hErHfnSmstxGQbXizO4OgnET1PudiaeEE/aQG4Fm/sJ4/tZiesjPnzpuRbMEy5G4chAYPPP6hgJjXLmpyZKCF@vger.kernel.org
X-Gm-Message-State: APuU4Z+s/cO9HlQFn5j91llgQtNVMeTHUPERBu09qXktJhofDTFIqqBA
	x/1xKgrcBH60saInLF8uSL+BV0Jo8uYBHz/exlpQZLz8aIbdZgv7hl/HdktZCsqQBliy56l/cW2
	gNwBAtEsLCGNy1ACLD9RCQ+krq1EkSGyg+PfF1zkXe9K1qyFMU3obx5TR4hmyjjGDrHNt
X-Gm-Gg: AYBFou3hvoY8ISe9QWhKE5MwbhpuobFugi30CIuENjXsCYXoylTTg71s+VZJiopJ6JP
	woPrfJFryzmZfttWtCP9QehyWczJb1ghkWDemVuKkEZjOt1OF9AOAd0BiSzgNe9FNh7zOYClvyH
	n0tli1wwwFlVws/4KVb4WF1WhNsHsvv0zJwEr94D9CJT2tcWo4dO6vdHow3EtmeLEFDGRea7Rgn
	mKI5/d5stO1wnMDyfUOZ13bh5cFjm/ZncgIEeU9bAZEDRrefrOc2I0dwCUhsj/QU7yZ7VE3fkkA
	3tD+6m7Yyhbd3WPg9z9E9ijDlBO8d6G0i+IJZmk7TQjtCfSQ7o/vL4QPklPBS4oJHQOwH9u4fge
	LLAsptS62ZjUmqY+bzK1BG1OFxhVs+N+NIo/ixRiQXHVHw+JpXd/IibmZZt04C+Cn+/hriDRN21
	emp/lOhEs=
X-Received: by 2002:a05:6a20:7d9f:b0:3e2:ac91:6bae with SMTP id adf61e73a8af0-3fe98af0f80mr2337724637.85.1794999962212;
        Wed, 18 Nov 2026 03:06:02 -0800 (PST)
X-Received: by 2002:a05:6a20:7d9f:b0:3e2:ac91:6bae with SMTP id adf61e73a8af0-3fe98af0f80mr2337687637.85.1794999961753;
        Wed, 18 Nov 2026 03:06:01 -0800 (PST)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cac8ffe6sm1040544b3a.23.2026.11.18.03.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 03:06:01 -0800 (PST)
Message-ID: <6965d3c1-1823-469f-8777-17fc52e132df@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:35:55 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bibek.patro@oss.qualcomm.com
References: <20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com>
 <20261117161904.2hecbffviqjz2dub@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20261117161904.2hecbffviqjz2dub@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rSbrxx71wuP4bZ7DnUStM-NtbqisQHjl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0NCBTYWx0ZWRfXymp2HsFYWbZ+
 eq9xOf0MCzQRMRdhkjgeNm5++CY48ibwPBIDDlKpGO36nOKZHUCKREJwZ0VQ3W0rkORlCvsRYLK
 iKYjS2xFNIBPySx4G0nZv5Ty6OHEC7A=
X-Proofpoint-ORIG-GUID: rSbrxx71wuP4bZ7DnUStM-NtbqisQHjl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0NCBTYWx0ZWRfX5U+1zfxUM80A
 JxGT+n4jyb7KKmMpJ4+EJY2rEWRhIJusF1fLxNlQKQ13kFdN2Av8AB9USwNARwhJz3m7DabXPvu
 FTNO9AXrYQsi8pttn99ozHYYSGnEp7t3kSZK2xcpXjcDsZgFTsm3ZdZmVio/Xg8guDo3lD4Bjo9
 LcqYZPhu9Ot7luIl6MY03NK/nGn8OtQj9A0wYd6u4scH1xPzdzqSI3+X9tJUE5y2BVd59JFFwLd
 ja/oLfSt+IgeT4qDgtnSRhC03npL4xKLJaeJqvI7WF2hUlfTPHEWV+PiKRIPogvoRAq3cPE/4/L
 X3KwTzX8SxPHw2QYnTKo8ZNT7ya9L8PZ5mf4DLOv5IJNXzsH5LmGxfOigGcUBONXHBMgqkzSMcs
 Mgr09hvNi8KbV7vZsQx3MiGqOxFwIOLMb6VjAPstRke5hnuMvUXJUW/nyDIIaBs0eJ8Mr76ISx7
 kvOpdqW3FF8Ivfii8Zw==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd869b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8YGeh5X12gIyrkFA4RQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180044


On 17-11-2026 09:49 pm, Mukesh Ojha wrote:
> On Tue, Nov 17, 2026 at 01:35:50PM +0530, Vishnu Santhosh wrote:
>> The RPM message RAM is shared with other subsystems, and parts of it
>> are not accessible to the APSS. It is expected to be mapped as Device
>> memory.
>>
>> The "mmio-sram" compatible makes the SRAM driver map the region as
>> write-combined (Normal Non-cacheable) memory instead, which allows
>> speculative reads into the protected parts and results in XPU
>> violations.
>>
>> Add no-memory-wc so the region is mapped as Device memory.
>>
>> Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Why only for Shikra ?

This XPU violation was seen only on Shikra, and only with Linux
running at EL2 (KVM). It is not seen on Shikra when Linux runs at
EL1 under Gunyah. So, I kept the change to Shikra.

Thanks,
Vishnu

>
>> ---
>> A similar issue was fixed for the Tegra SYSRAM in commit 61192a9d8a63
>> ("arm64: tegra: Mark BPMP channels as no-memory-wc"):
>> https://lore.kernel.org/all/20220622132300.1746201-2-cyndis@kapsi.fi/
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index 2623e139196f6398c57b616879a37f84b83d59ac..597aaf490519e605d50e24c090bbfb1e47b1f28c 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -1347,6 +1347,8 @@ rpm_msg_ram: sram@45f0000 {
>>   			compatible = "qcom,rpm-msg-ram", "mmio-sram";
>>   			reg = <0x0 0x045f0000 0x0 0x7000>;
>>   
>> +			no-memory-wc;
>> +
>>   			#address-cells = <1>;
>>   			#size-cells = <1>;
>>   			ranges = <0x0 0x0 0x045f0000 0x7000>;
>>
>> ---
>> base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
>> change-id: 20261117-rpm-memory-non-wc-c93a6ff3e432
>>
>> Best regards,
>> -- 
>> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>
