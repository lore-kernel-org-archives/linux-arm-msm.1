Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797131;
	b=piyCpjGw4VPwnTZ568OFBFXWQqnNRLipzYC5FkJGnAyVM6J90MFJnt8C0bbDebZrNMtL
	 EnrPeScp8hOs62JqLauqJDKbLg+7K4SlC46F0rHNUQRyhEcvPjVTfHC0Do8b29BmnFUv4
	 5EVG8/lBLEzdr7fCN4A250BKvGyBPUdJvUk1GCclD/6bH/6eFvs8zyGMxVujJGOivS4la
	 BR9Ld5Pw7rhHjBBx1RzfrsyQfMjyLQlTr6mgzMhRy5lH8DhVgjH17kbf8AdHmzKAKpHz0
	 piGNzgwA7oGofbXwCfB+33cr9F4BMyeeYosUw+CyUqJd9FT+3Nmdfsg12KuT/X1q52g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797131;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mwCkDJFZoqbMqAzqKG3ZXny/3GlMXYpZIR38ZotC6Sg=;
	b=HX/rpnKHD4K1YXRLbt6EZgG/Lcxnd7ngUnnV5AYmjl/wGr8FWyQOFXw+Xm+RlTTxLUjy
	 p8X/lFJPbQbe5ivHYUJuVYLB0SEOWbLpKaoxtOm1DL92GRkSrtiqmUVpn6DKfaRguNAbN
	 Z+WOr5XTpltAiyKB+GaXsznb5NjrVa8YP0ql9qNE5Ex4AZcm7eXoWwD3MWhu7HVrO1XQl
	 1jIWpcCHa1gzk0SoWquZrQHtjRBOrwUp4U18yxnCem0h2UWbhW7ndkKj9Y9/cSNG2cuiD
	 TqR8LibPdH1DiHZO29Of4jPUk1riF6LaCl3yMf4gpbT5leWCZMJwi0VGU8SaBziJSkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Xb/La5K9";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F7oq4SPK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B514C606A332
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 12:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B514C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xb/La5K9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F7oq4SPK
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BaGB82310652
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 12:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mwCkDJFZoqbMqAzqKG3ZXny/3GlMXYpZIR38ZotC6Sg=; b=Xb/La5K9VRfyMjN1
	l7kZO6beSCpdVW9c/ew1qWg0Cjf04luSSFcjwu/QNYkQp9e3ALipseJZbOnUagrR
	eBygU3PewFnQQoQnlo2weRELRBbJ45X7Y2HCe+BpPQsbojjKBJSTboH7IfkVnQ1G
	n6qDMR3q0nAxMmQQYITZ0WrTe5wXlACsMNCNOA2kEJpNxBhinXF3ERtfg9yotx/y
	gozlVMenv9/DI+BZs72JYuLDRAlxpHzGhDLdUZtJhKYCkOllqpg6+46gqBvAl5hy
	9uppMgDB4YM0RP6On0mvJAZzvOAnJ8JbR5khpC1G6V5iLjVDXcCQsCc5oH8h29K2
	VZfnKw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8muxdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 12:58:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so539682a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 04:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793797128; x=1794401928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwCkDJFZoqbMqAzqKG3ZXny/3GlMXYpZIR38ZotC6Sg=;
        b=F7oq4SPKuD5debzDfGWaY42Yem57pu+Z0/UMCk/F2bfGF9DHzZx65mMmX69nW7zCwB
         OfTX4HNRiWO99yYuLKDGoo7uGUVrun0Rls7BOsGUrfcI/+DxQr0lRYPQJN0naLzxFKz9
         O/lzluq236ewynaxmqL4/A/qn1A93QmZeHwXB8UhLmOdCcPUdCSKssbgk6F6rA1Lf7Tx
         sueaWQByUqrXMRXuvQAhoHjz26+TnZoLEmiVZo5qpBRjVk3QHKxLn3poLC1li+axYJuu
         DsRkgJ1b4nI30hvBNA5HrdOrYtvntEbeAs1+HNj76QPnq90Lho6GJ6gvgojoQjxBggXr
         eXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793797128; x=1794401928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwCkDJFZoqbMqAzqKG3ZXny/3GlMXYpZIR38ZotC6Sg=;
        b=KeinVUXhcvGwGSg2Z/a7yBkOJ9eQxE5bMGMFxwFWf1IuCOotMBlRRBeYEY6M9Jg4cl
         gSwox028B+GM8IP32QJCEgCb1NlfANtJjfGSk/Peg5NBlnXzGkKINFwOAJMqD5Siuvu7
         +7FEKMU4GoUY2fumlcamkW8PGbLVmq1mnEnR3KJThPalGcPUq+YzMpUEAcYEJw7DeN3y
         AZlG6dNZtGDZvxzdznK5hWrz+47dPOD3gy2OHXI8BQ1kOQWMGWJYFesLk9tMtSd6lpNz
         T+OiEX/ofYZT3wEPfjr7nUyIqK21yp1tWsIS2ahkbs7elxRCq4rlFapT3YSP4RQAMCOR
         Abfg==
X-Forwarded-Encrypted: i=1; AKwUvByIpiNAdWfunbomFz5A8V2lWskT1C5qREOoyiTlrEr8tsMJhI2ct0reM0gQVs0dT2ASoYdDf3BH6ViJ7o8K@vger.kernel.org
X-Gm-Message-State: APuU4Z+LNvD+CDXOJ4s2vPSYNbtzIOMILQzXCupoBiuefTY6LghHchg0
	zAjQ6tIkyB48uBJD+FTQbgNr3MwLnZPHdufwqU6v0Jc2Dw4W/UcgVJiqpxrDU5m4OJFE6Xv8o0z
	S7ixUoUK0TG9GRqHLH89cedz9vqAnWlWf5VC5ssF0e4jkCHy5m6ZJ036TukgOEMBISe5U
X-Gm-Gg: AYBFou12sZ+9htNN2UGFLdIebTsvKvTVrHtA9d3uYe/K3ngY3yoFfh4O1akmc9DbnID
	ZfdzFgWTf5eGHZsjXST+wu2d9RPVvv7UETrK+Z16o7U9FlcBQ5tmpJFNcsPbHe9HKKByzjgTCK6
	66+0UIWPzoDMb89yf7qs6B2P56PlWj42wsoQ/KTstFTLLStJ/pb32VIkH/d4g20mg18Mt4uGXRd
	L7nC/K/2EQP1rZh+/vzFaoLSNycklc4/tcbnxLAu8RG0KkbqsUOINmb1pGZix2K62bgDHqbVja7
	KRYkKDYH6608lBgT9OmRpVmitTv39uh5PoTAqTnk37Jys6BB/ykIkrXrbO7oeDtPt3BSD2gAXCA
	1TY5pVqSthHn43KBgGVpZV11LlrTxpPxfPpDEMi3esHCkUPeNQEshls21yrtgj609ccw7MlBip0
	quCLnbMQ==
X-Received: by 2002:a05:6a20:a124:b0:3e1:e53b:5005 with SMTP id adf61e73a8af0-3e92901056dmr16655517637.65.1793797128334;
        Wed, 04 Nov 2026 04:58:48 -0800 (PST)
X-Received: by 2002:a05:6a20:a124:b0:3e1:e53b:5005 with SMTP id adf61e73a8af0-3e92901056dmr16655474637.65.1793797127680;
        Wed, 04 Nov 2026 04:58:47 -0800 (PST)
Received: from [10.92.198.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb469b1f96sm1055018a12.30.2026.11.04.04.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:58:46 -0800 (PST)
Message-ID: <784834c9-034b-42e5-98b2-8660180dd6fe@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 18:28:38 +0530
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
Subject: Re: [PATCH v4 02/12] hwmon: Add Qualcomm PMIC BCL driver
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
 <5598422c-8830-4fcf-be2b-e4486ea64539@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <5598422c-8830-4fcf-be2b-e4486ea64539@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fjVje03WYMszLzOo-ueTzwmdVjXegoRA
X-Proofpoint-ORIG-GUID: fjVje03WYMszLzOo-ueTzwmdVjXegoRA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MSBTYWx0ZWRfXzF2/hdljGNEf
 JDkW0O2vpoNhE9R6Y0GFGtPNZ8irq+SiEgw0rF32FKMBcw+FEt/1LGBC+Bck+XrXw0B86ddCy3P
 CEWJuxjYOZMifYRHWDIzaPLjTTov1aMnJqVvUPYKo+w6npgIr8MZ7+OP0WKkIRD/lPXNM3cJg2p
 1XfqUk5j7PeRVXPp3lQtfnrxSyk5Fxsi8Bw4o4S14WmgveUBYzFcxttTzk7GWfqmb+OCBKR58F8
 CYyAWNZyUE89UjaVa5+z3SjTQAE4kY7t6GXV8qRsgcIACvoiLciaFhZSx3ibNCSw8SO0Nr4MGvj
 Dz3tjf99MeJSbqjLICMq+AhM3zkgFAVvEfF8SsKTASDKAjizt1+ZFbSHNsPF1Jnw+0x73HI6ZF9
 0xKbf7aIkWA4RE1NMXIm0kBABv3Sl0rvzbA9+EhY9+kWkvtRPnAERBM21T6dP+N3KRjkt/INCdK
 Wwcm0miqp8yRCqEPyjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MSBTYWx0ZWRfX2M6Do7OHpVVN
 X8vQtiXRCx1a/linsa8E9BNV973Jbn1wRRo9nrOIdst4T/cPAFAJ2eLy3W2Y+bYii2QYgZvLYNx
 gff0fX8AtxT4smpGOHtId2iDHAXu+XM=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeb2c09 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Eqzg2zcYyYqNIvlFOjsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040051

Hi Daniel,

On 10/27/2026 4:51 PM, Daniel Lezcano wrote:
> 
> Hi Manaf,
> 
> On 10/5/26 14:24, Manaf Meethalavalappu Pallikunhi wrote:
>> Add driver for Qualcomm SPMI PMIC Battery Current Limiting (BCL)
>> hardware monitor. The driver exposes battery voltage and current
>> monitoring through hwmon interface.
>>
>> The BCL driver provides
>> - Real-time voltage and current readings
>> - Configurable threshold-based alarms
>> - Interrupt-driven notifications when thresholds are exceeded
>> - Automatic threshold management with polling-based recovery
>> - Hardware-specific scaling factors and threshold representations
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi 
>> <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> There are a couple of issues in sashiko related to this patch (devres 
> LIFO issue and 6 bits encoding value too short for the represented value).

will check and update in next revision

> 
> [ ... ]
> 
>> +/**
>> + * struct bcl_channel_cfg - BCL channel related configuration
>> + * @default_scale_nu:  Default scaling factor in nano unit
>> + * @base_mu: Base threshold value in milli unit
>> + * @max_mu: Maximum threshold value in milli unit
>> + * @step_mu: step increment value between two indexed threshold value 
>> in milli unit
>> + * @thresh_type: Array specifying threshold representation type for 
>> each alarm level
>> + *
>> + * Contains hardware-specific configuration and scaling parameters 
>> for different
>> + * channels (voltage and current).
>> + */
>> +struct bcl_channel_cfg {
>> +    u32 default_scale_nu;
>> +    u32 base_mu;
>> +    u32 max_mu;
>> +    u32 step_mu;
>> +    u8 thresh_type[BCL_LIMIT_ALARM_MAX];
>> +};
>> +
>> +/**
>> + * struct bcl_desc - BCL device descriptor
>> + * @reg_fields: Array of register field definitions for this device 
>> variant
>> + * @channel_cfg: Array of channel configurations indexed by battery 
>> config
>> + *               PMICs without battery detection: only [BCL_BATT_1S] 
>> is defined
>> + *               PMICs with battery detection: [BCL_BATT_2S], 
>> [BCL_BATT_3S]
>> + * @battery_config_field: Register field for battery configuration 
>> detection
>> + *                        NOTE: This is an ABSOLUTE address, not 
>> relative to BCL base
>> + *                        Set to REG_FIELD(0, 0, 0) if not used
>> + * @num_reg_fields: Number of register field definitions for this 
>> device variant
>> + * @data_field_bits_size: data read register bit size
>> + * @thresh_field_bits_size: lsb bit size those are not included in 
>> threshold register
>> + * @in_mon_enabled: Voltage monitoring enabled at boot
>> + * @in_input_enabled: Voltage input reading enabled at boot
>> + * @curr_mon_enabled: Current monitoring enabled at boot
>> + *
>> + * Contains hardware-specific configuration and scaling parameters 
>> for different
>> + * BCL variants. Each PMIC model may have different register layouts and
>> + * conversion factors.
>> + */
>> +struct bcl_desc {
>> +    const struct reg_field *reg_fields;
>> +    struct bcl_channel_cfg channel_cfg[BCL_BATT_3S + 1][CHANNEL_MAX];
>> +    const struct reg_field battery_config_field;
>> +    u8 num_reg_fields;
>> +    u8 data_field_bits_size;
>> +    u8 thresh_field_bits_size;
>> +    bool in_mon_enabled;
>> +    bool in_input_enabled;
>> +    bool curr_mon_enabled;
>> +};
> 
> It is your call but I suggest to use a single variable:
> 
> eg. u8 features
> 
> and use masks
> 
>      features = IN_MON | IN_INPUT;
> 
> that will reduce the declaration size below.

ACK

> 
>> +/**
>> + * struct bcl_alarm_data - BCL alarm interrupt data
>> + * @irq: IRQ number assigned to this alarm
>> + * @irq_enabled: Flag indicating if IRQ is enabled
>> + * @irq_wake_enabled: Flag indicating if IRQ wake is enabled
>> + * @shutting_down: Flag preventing work from re-enabling IRQ during 
>> teardown
>> + * @type: Alarm level type (LVL0, or LVL1)
>> + * @device: Pointer to parent BCL device structure
>> + * @a_lock: Mutex for protecting alarm state
>> + * @alarm_poll_work: delayed_work to poll alarm status
>> + *
>> + * Stores interrupt-related information for each alarm threshold level.
>> + * Used by the IRQ handler to identify which alarm triggered.
>> + */
>> +struct bcl_alarm_data {
>> +    int            irq;
>> +    bool            irq_enabled;
>> +    bool            irq_wake_enabled;
>> +    bool            shutting_down;
> 
> Same suggestion

I wanted to keep these as separate bools. The shutting_down is accessed 
lock-free via READ_ONCE/WRITE_ONCE in the IRQ-handler fast path, while 
irq_enabled and irq_wake_enabled are accessed under a_lock using plain 
reads and writes. Packing them into one flags byte would make updates to 
the other flags read-modify-write operations on the same byte that the 
lock-free path reads with READ_ONCE.

> 
>> +    enum bcl_limit_alarm    type;
>> +    void            *device;
>> +    /* Protects alarm IRQ enable/disable state */
>> +    struct mutex        a_lock;
>> +    struct delayed_work    alarm_poll_work;
>> +};
>> +
>> +/**
>> + * struct bcl_device - Main BCL device structure
>> + * @dev: Pointer to device structure
>> + * @regmap: Regmap for accessing PMIC registers
>> + * @base: the BCL regbase offset from regmap
>> + * @fields: Array of regmap fields for register access
>> + * @bcl_alarms: Array of alarm data structures for each threshold level
>> + * @lock: Mutex for protecting concurrent hardware access
>> + * @last_in_input: Last valid voltage input reading in millivolts
>> + * @last_curr_input: Last valid current input reading in milliamps
>> + * @last_in_updated: Timestamp of last voltage input update
>> + * @last_curr_updated: Timestamp of last current input update
>> + * @desc: Pointer to device descriptor with hardware-specific parameters
>> + * @hwmon_dev: Pointer to registered hwmon device
>> + * @hwmon_name: Sanitized name for hwmon device
>> + * @batt_config: Detected battery configuration (only for SMB2360/2370)
>> + * @batt_config_regfield: Regmap field for battery configuration 
>> register
>> + *
>> + * Main driver structure containing all state and configuration for a 
>> BCL
>> + * monitoring instance. Manages voltage and current monitoring, 
>> thresholds,
>> + * and alarm handling.
>> + */
>> +struct bcl_device {
>> +    struct device        *dev;
>> +    struct regmap        *regmap;
>> +    u16            base;
>> +    struct regmap_field    *fields[F_MAX_FIELDS];
>> +    struct bcl_alarm_data    bcl_alarms[BCL_LIMIT_ALARM_MAX];
>> +    /* Protects hardware register access and device state */
>> +    struct mutex        lock;
>> +    u32            last_in_input;
>> +    s32            last_curr_input;
>> +    unsigned long        last_in_updated;
>> +    unsigned long        last_curr_updated;
>> +    const struct bcl_desc    *desc;
>> +    struct device        *hwmon_dev;
>> +    char            *hwmon_name;
>> +    enum bcl_battery_config    batt_config;
>> +    struct regmap_field    *batt_config_regfield;
>> +};
>> +
>> +static const u8 in_attr_to_lvl_map[] = {
>> +    [hwmon_in_min] = BCL_LIMIT_ALARM_LVL0,
>> +    [hwmon_in_lcrit] = BCL_LIMIT_ALARM_LVL1,
>> +    [hwmon_in_lemergency] = BCL_LIMIT_ALARM_LVL2,
>> +    [hwmon_in_min_alarm] = BCL_LIMIT_ALARM_LVL0,
>> +    [hwmon_in_lcrit_alarm] = BCL_LIMIT_ALARM_LVL1,
>> +    [hwmon_in_lemergency_alarm] = BCL_LIMIT_ALARM_LVL2,
>> +};
>> +
>> +static const u8 in_lvl_to_attr_map[BCL_LIMIT_ALARM_MAX] = {
>> +    [BCL_LIMIT_ALARM_LVL0] = hwmon_in_min_alarm,
>> +    [BCL_LIMIT_ALARM_LVL1] = hwmon_in_lcrit_alarm,
>> +    [BCL_LIMIT_ALARM_LVL2] = hwmon_in_lemergency_alarm,
>> +};
>> +
>> +static const u8 curr_attr_to_lvl_map[] = {
>> +    [hwmon_curr_max] = BCL_LIMIT_ALARM_LVL0,
>> +    [hwmon_curr_crit] = BCL_LIMIT_ALARM_LVL1,
>> +    [hwmon_curr_max_alarm] = BCL_LIMIT_ALARM_LVL0,
>> +    [hwmon_curr_crit_alarm] = BCL_LIMIT_ALARM_LVL1,
>> +    [hwmon_curr_emergency_alarm] = BCL_LIMIT_ALARM_LVL2,
>> +};
>> +
>> +static const u8 curr_lvl_to_attr_map[BCL_LIMIT_ALARM_MAX] = {
>> +    [BCL_LIMIT_ALARM_LVL0] = hwmon_curr_max_alarm,
>> +    [BCL_LIMIT_ALARM_LVL1] = hwmon_curr_crit_alarm,
>> +    [BCL_LIMIT_ALARM_LVL2] = hwmon_curr_emergency_alarm,
>> +};
>> +
>> +/* Interrupt names for each alarm level */
>> +static const char * const bcl_int_names[BCL_LIMIT_ALARM_MAX] = {
>> +    [BCL_LIMIT_ALARM_LVL0] = "max-min",
>> +    [BCL_LIMIT_ALARM_LVL1] = "critical",
>> +    [BCL_LIMIT_ALARM_LVL2] = "emergency",
>> +};
> 
> why not fold the structures into a single one?
> 
> eg.
> 
> struct attr_lvl_map {
>      const int level;
>      const int attr;
>      const char *name;
> };
> 
> const curr_attr_lvl_map[] = {
>      {
>        .level = BCL_LIMIT_ALARM_LVL0,
>        .attr = hwmon_curr_max_alarm,
>        .name = "max-min"
>      }
>      ...
> };
> 
> And a function lvl_to_attr() / attr_to_lvl()
> 
> ?
> 
> 
> [ ... ]

ACK

Thanks,
Manaf

> 
> Thanks
> 
>    -- Daniel

