Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3125293F5
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070877; cv=none; b=OO6siEdRtPW2x4ZrvNJ9vm/SmfMMGmJOBGi3ENb6ETf40IBCtBoXTFc8M+YNknEWG6DxxXr54IWpwKxGrOnIqmTfHn6VDlBQr2ySfQD/fE92CEZZBQ9onV12vQCfrtn3hRkvm9jpOrpjQIXHpJMaGj8/xH+LCtDSMQ378zzC8mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070877; c=relaxed/simple;
	bh=Cy5efQytt+41nF34oSFTJHXGoIio5RSUN47XHf9W3yo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Wap1LXoIaREujK1iBn2ZfZhRUoQbvz735ihkLwm57ubOluhGlXvwpD9Ql/+kkgQirEWfQ89+zryr0bmzCE1HqBv0Ak9X/25pQ2E0M4eP2Hky5lUhiwzbwX9Ay6vCMunej/3Ti3wzkjUhGb73CxG7/+VbY0z7HGIEdBzwDhrQklk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJ0Xs7fo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BKM5PBnz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJ0Xs7fo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BKM5PBnz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jW062416991
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BOf15NrdkxiPINzdwNBadsG1wlt6SXt9rit5Z9dSmV0=; b=HJ0Xs7foraW16FLZ
	1oX4YqrOsDoSmz+Yu+eG9Y5grHQdrgFlERSKYtZ9bxwVz8OWItS5Uy7Zp7NfExy7
	8mBZUXr4RRxksr88UYO2WLe4PPV3HukslXP6mpx3zmb1j/g6bcFPK1CIIzXXOOnn
	KJHaqtHZXqDWe+wl3wppEfaAYRBn2wzJDLcF1t6OpjjokBuoYEMpST4LG2KPMycW
	Ms27Htc80OG7bh8B/2jomg2EycNy3oW7/8P9x2KhXzv2LHBJoRHsGF5/gb7Bur3D
	C8U6tASJ2zh/AFYF092T4oOd39Gb92OCQnKIv+TI+6Ucm0GPbywrQBCT7BmAb6Jm
	UlTtpg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhj9me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:27:49 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988bf286521so54567241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 06:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792070868; x=1792675668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BOf15NrdkxiPINzdwNBadsG1wlt6SXt9rit5Z9dSmV0=;
        b=BKM5PBnzztioXzz6DRztKekpDwdrV768IVx40daVZLkogs53YY/IdmvOn+ojw1CJcU
         rj/PanLdvkyHSzN91fkvCBTmfIqzLib0/CTJPIWwXaTsZkTF9NVeKBFklJlJ9Uz237EW
         wHJDHxnRpI+817bWOcN7WjslFZ5baGJEkvnpV6CG/AHoHsFqrkyHNRrzIww43Gk3+BM7
         Etqbb+HVgAVM2gIcX3gwjX2UNwO/hgTImyams+fPupGP7aE4UnBh8xa27th21GMdeO0o
         sYij8428itx7EatN2PpxGe8SwDrDflrcAybjt2itQdpF3F4p8TSh4AxnmNzyUCbLDrhA
         kkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070868; x=1792675668;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BOf15NrdkxiPINzdwNBadsG1wlt6SXt9rit5Z9dSmV0=;
        b=J5v12aZNjuA2OMjxqFMxt6+LaFBgwy4CjnVSasH/wKJI83g9a7ivLRb4ggVDpFmABi
         2e8CjnJaILZi4fxeRbQtXcxPy9i9IekEUudsY+3xoF7aXcMYbo92kPSZPSmPOA9JxN0g
         PYIon0sI8dRY+3eD7qnGw7JgjAKvzCtM7uNRpFWoU0p/cLLFgXq3BCbEE5+hHxeFdERc
         uYFuo47fwmNr2vcJIu2m3ZJnYW4FkVOeA9p8kvlWqoVVNWMMacMhHmO9mCTg0FNzXHdD
         EczXh3MqLJUhw6IbA9Qw/tpc+nZlPXrVKYov05QBPDBfvg9MR4Bj+OagWDhxTix1j32k
         yzqQ==
X-Gm-Message-State: AFq9FYK/nEsjx1snrTaMw4c2W0qWlA0LrVBnbpk4ggF2+hZUazSyGda3
	HyLlN4HCP9YQLlC305A9F48zx2FtTBM7wyXfaaEyViYLw9EEWLEGEW5Z0apzyGcCIromx5159DK
	1NG+qHbn8qcRbKPGjTXC9mmPE0iquDpPj9E42aO1iziMWQ3Xx8g7chfwhZpZW28+LphR7
X-Gm-Gg: AYBFou2QdFQpzbjRQGUvVwrHcbLWE1sxmg5Wn81sly0y4hKaPjpE6DDYZzCpnuUKFsW
	cIqEbjDJmx7Iulr9lRljq/jiQX2WVTjzaPEa9u6VZNDbcZXCRv+BC3u2oVbbW5MY2fRXHMEXAqi
	wheZNWVw8/86M+k364ehlC/bV7MTKt5lNd2olvPvFBXYUgAa6UfH33EEVR8YuPnUjKoOzX8HkAH
	ZzSALAewT9uiqM4qjyXfLQEQu8OpYODxLeR2GApgLzLunwfsczZSjNudWAA8hXK2deVsiID50z/
	gD2bv3csIFa9WAU+FbIBuylSeaU5XLwf9eqKw4F31K84CN8MLXH1YcNArg4OobBe6CkPRKBkgb0
	sPf/qKUL0LGfO4To78VStXg==
X-Received: by 2002:a05:6122:2c09:b0:5ea:8fce:8a45 with SMTP id 71dfb90a1353d-5ea8fce8d42mr266742e0c.5.1792070868155;
        Thu, 15 Oct 2026 06:27:48 -0700 (PDT)
X-Received: by 2002:a05:6122:2c09:b0:5ea:8fce:8a45 with SMTP id 71dfb90a1353d-5ea8fce8d42mr266728e0c.5.1792070866958;
        Thu, 15 Oct 2026 06:27:46 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b2038a6f4asm2435041a12.31.2026.10.15.06.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:27:45 -0700 (PDT)
Message-ID: <b957c95e-89b9-4e62-9e88-0c5754771511@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:27:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] power: supply: qcom_battmgr: do not report power_now on
 SM8750
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-pm@vger.kernel.org,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
References: <20261013002124.332111-1-xiaqinghuan@mail.ustc.edu.cn>
 <d3a67d47-9072-4094-85a0-7e1b75e08314@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d3a67d47-9072-4094-85a0-7e1b75e08314@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfX2Z2kAgTDRXbA
 3i/1DKgQ1lE4LmK45AFag/EPWqDVeVe88pJT3g7K8CkSVupwmRa8ovRjbaTvLCsjVcMTzCi0SIL
 T4RopJ6YiM2uKTrl4ODYLqBy7uehQTG0VgEPxVyvkNERQyPqRPfAZoA+SHP5haOjjl91Zch4n1v
 r8M7UiVh/AJAlzn2E1ZB4uQCpH0rvN/ymPfpiblhOa+qC8nzMNZmHr2XhTh8SzGoGm9k7dZcDXT
 eL9nT+E+frgc+Xhsocx8/P6clzozCAaKOkYBVzhi57jNjAWsumVDdn4NLylEI/8PFQzVHclqgAS
 PvYFb1Yl89G3AT4SAohG4G2bN1Z1lqzde/KeOMdhKiRsnOwahE0qeep0y/msAJf47hQqWssRleV
 TgLJpCA0fsO7/fICxb/5PBkPHQ1vKWzwMXbkqY9ZuOAcyLGlR4aAAn3YkV/PoP9C/Qf+RR00t7Q
 FkhFkdAXNp6oBxyxDJQ==
X-Proofpoint-GUID: N7-Qijon8Kf5V4RExmmoO7Yl72TciQft
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0d4d5 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=JDoO2zy-Mf1dR4DM0PkA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfXwKugNqxXymRd
 YI64YcfXdz5UHg92n5+NZACGqY2VTNywMkPbNS3heJzsx+omAmnlIcZHb/tDoFRSNpE88lio9wq
 MNenb2h56caBwsACzGZ0N6D8E3bo0Q4=
X-Proofpoint-ORIG-GUID: N7-Qijon8Kf5V4RExmmoO7Yl72TciQft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150053

On 10/15/26 3:27 PM, Konrad Dybcio wrote:
> On 10/13/26 2:21 AM, Qianhui Xu wrote:
>> From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
>>
>> The SM8750 QBG firmware fills BATT_POWER_NOW via its maximum-load updater
>> instead of an instantaneous measurement: the property getter indexes
>> context + 0x6a8 + 4 * property, so property 22 (BATT_POWER_NOW) reads the
>> offset written by the maximum-load path.  Exposing that as power_now makes
>> userspace report e.g. 89 W while the battery is charging below 1 W, or
>> above 100 W while discharging at about 4 W.
>>
>> The SM8750 PMIC GLINK node is already described in DT
>> ("qcom,sm8750-pmic-glink" in sm8750-mtp/qrd), but the driver has no entry
>> for it, so it falls back to QCOM_BATTMGR_SM8350 and advertises POWER_NOW.
>>
>> Add the SM8750 variant and a battery descriptor that reuses the SM8550
>> properties without POWER_NOW.  The property array is reordered so that
>> POWER_NOW is the last entry, which keeps the new descriptor a two-line
>> addition; property ordering itself is not ABI.
>>
>> Voltage, current, charge counters and the charge-control thresholds are
>> retained.
>>
>> Tested on Lenovo Legion Y700 Gen4 (TB322FC, SM8750P): charging and
>> discharging, UPower state-of-charge and rate are unchanged and power_now
>> is no longer exposed.
>>
>> Signed-off-by: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
>> ---
> 
> +Fenglin would we know if this is an issue on all SM8750 devices, or
> perhaps something OEM-specific?

(helps to actually Cc someone when you say you do..)

> 
> Konrad
> 
>>  drivers/power/supply/qcom_battmgr.c | 29 +++++++++++++++++++++++++++--
>>  1 file changed, 27 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
>> index 7716eb9e1a..dbc98ac8a7 100644
>> --- a/drivers/power/supply/qcom_battmgr.c
>> +++ b/drivers/power/supply/qcom_battmgr.c
>> @@ -24,6 +24,7 @@ enum qcom_battmgr_variant {
>>  	QCOM_BATTMGR_SC8280XP,
>>  	QCOM_BATTMGR_SM8350,
>>  	QCOM_BATTMGR_SM8550,
>> +	QCOM_BATTMGR_SM8750,
>>  	QCOM_BATTMGR_X1E80100,
>>  };
>>  
>> @@ -916,9 +917,13 @@ static const enum power_supply_property sm8550_bat_props[] = {
>>  	POWER_SUPPLY_PROP_TIME_TO_EMPTY_AVG,
>>  	POWER_SUPPLY_PROP_INTERNAL_RESISTANCE,
>>  	POWER_SUPPLY_PROP_STATE_OF_HEALTH,
>> -	POWER_SUPPLY_PROP_POWER_NOW,
>>  	POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD,
>>  	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
>> +	/*
>> +	 * Kept last on purpose: SM8750 reuses this list without POWER_NOW,
>> +	 * see sm8750_bat_psy_desc.
>> +	 */
>> +	POWER_SUPPLY_PROP_POWER_NOW,
>>  };
>>  
>>  static const struct power_supply_desc sm8550_bat_psy_desc = {
>> @@ -931,6 +936,23 @@ static const struct power_supply_desc sm8550_bat_psy_desc = {
>>  	.property_is_writeable = qcom_battmgr_bat_is_writeable,
>>  };
>>  
>> +/*
>> + * The SM8750 QBG firmware fills BATT_POWER_NOW from its maximum-load updater
>> + * instead of from an instantaneous measurement, so the published value is not
>> + * a present power reading (it reports the maximum load, e.g. 89 W while the
>> + * battery is actually charging below 1 W).  Do not advertise POWER_NOW on
>> + * this platform.
>> + */
>> +static const struct power_supply_desc sm8750_bat_psy_desc = {
>> +	.name = "qcom-battmgr-bat",
>> +	.type = POWER_SUPPLY_TYPE_BATTERY,
>> +	.properties = sm8550_bat_props,
>> +	.num_properties = ARRAY_SIZE(sm8550_bat_props) - 1,
>> +	.get_property = qcom_battmgr_bat_get_property,
>> +	.set_property = qcom_battmgr_bat_set_property,
>> +	.property_is_writeable = qcom_battmgr_bat_is_writeable,
>> +};
>> +
>>  static int qcom_battmgr_ac_get_property(struct power_supply *psy,
>>  					enum power_supply_property psp,
>>  					union power_supply_propval *val)
>> @@ -1617,6 +1639,7 @@ static const struct of_device_id qcom_battmgr_of_variants[] = {
>>  	{ .compatible = "qcom,sc8180x-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
>>  	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
>>  	{ .compatible = "qcom,sm8550-pmic-glink", .data = (void *)QCOM_BATTMGR_SM8550 },
>> +	{ .compatible = "qcom,sm8750-pmic-glink", .data = (void *)QCOM_BATTMGR_SM8750 },
>>  	{ .compatible = "qcom,x1e80100-pmic-glink", .data = (void *)QCOM_BATTMGR_X1E80100 },
>>  	/* Unmatched devices falls back to QCOM_BATTMGR_SM8350 */
>>  	{}
>> @@ -1690,7 +1713,9 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
>>  			return dev_err_probe(dev, PTR_ERR(battmgr->wls_psy),
>>  					     "failed to register wireless charing power supply\n");
>>  	} else {
>> -		if (battmgr->variant == QCOM_BATTMGR_SM8550)
>> +		if (battmgr->variant == QCOM_BATTMGR_SM8750)
>> +			psy_desc = &sm8750_bat_psy_desc;
>> +		else if (battmgr->variant == QCOM_BATTMGR_SM8550)
>>  			psy_desc = &sm8550_bat_psy_desc;
>>  		else
>>  			psy_desc = &sm8350_bat_psy_desc;
