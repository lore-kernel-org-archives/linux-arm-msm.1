Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8CA3A6417
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 05:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744584; cv=none; b=VeFxKa8f0yFW6DDjsW7T9MfGqvDgBxj7SjFiWEBwGONr/8qmwLx2sP7NHhdiDkS/v1nTRrRjImZZ979HS4jsqQbcgHfT/wlW0EqDwOYD+s5GHJYFdwnIC+zh3rbKJ/FaRcK6h+o/OwPTZCaUqeFgg1IqW0c8t+E0ZBbiMoEVY5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744584; c=relaxed/simple;
	bh=aa5m/7BK7/DbTvlCizArErjlcAXnc5ec7jWXk2pJ/iU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FwCgetJP10DuQUPsvw+SwzW1fWyKrM2b/5Cx6IZUDprou2VIGLioBM3wnVs6dYkgJ0SiWTgGrr6gQOq4EwNK1hO/gMHglyBqofdmI6nPy9FOnrQcQnzBiNC76zk5IbSDuR1qY448znFg+61iHR6Jq+zw65c1VviF4NfMGGQdHpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXHPYJ6F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G++BKdZk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXHPYJ6F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G++BKdZk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TNQHVv2010184
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 05:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qkg6ZsioMZw6EFu9fkXHTIgiUwtXNeSZKmXw0kdl0wo=; b=XXHPYJ6FeDHCsKs/
	gTUZP0A8B7VEKvxP3/ZQGrMcRXiqJma6U6+0a/4UEXZA0tZePMhR+iRHKNDFiyVg
	n6qigTH4VHX6L7APsHkzod0dTpR3Yu0H+of2UFG2Djj0yoazkdJY8U4deJT8Q4hP
	LIvrlHDOwI/8brieRCU0HU01XTWNdak+F11htJRuWD9wzXbkvKTZDzEKTLPMv1jh
	lP8KCFVTsOcy90kUEEbEwhNFRXwUqB6UyTLj6x7DZuzn6aBxoisjefLP5ej15iiK
	8bXA/T6czpOtTnNCeNO8VoVmCkSzHlgFLnK0xPiR0vLX3Q2p75L2vlUK1iZmqyz+
	OA5Hmg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0ftuk5w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 05:03:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db87f759c5so49591385ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 22:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790744581; x=1791349381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qkg6ZsioMZw6EFu9fkXHTIgiUwtXNeSZKmXw0kdl0wo=;
        b=G++BKdZk352LLZJyzrjYG+s47bN60IEZrkGf/XGZfSWKeCHBglq2zGvk3yLEFbh7tQ
         A2sAz+SdokTsVZJdtBiOjJ+iXtg7PTzwL13VmKQcbhRkK+6PrEbrppKKAmVd3MZjpdT2
         KAdAgGwLp0vxVuI+MhP+YolvXooRPoTyviE17Vmoqqhx1+ijPX3lWQkpwsds7VDI5mTb
         G9Jj2IE7YHyXHDu6SakSiC+a+csDXH7l3z4jVxSrWYS8+J7GqHaKzR+qle5Z5W8D0jGb
         /E3mFPiwkCdZNn3XEbCufjfCrMSygt0aSPnK0/NMb3/6IeWjdHeSClYw7HzJTYKulcfg
         /EQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790744581; x=1791349381;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkg6ZsioMZw6EFu9fkXHTIgiUwtXNeSZKmXw0kdl0wo=;
        b=naiRFTsTLLjqxVpUReJor/FieGOm8QNItcyZN+0gOEnnxzMEwafp0Or6a8cC6XKv2A
         0UJA2k2zK5tYE3KgxLYUGy/oy4S5siSJID18tIVdZulUdUFlVjBlwogdcd9pDELFKhhl
         Njp2txJc+oKIyuQoj/GtgLBdhi/+37cUcVJDQQHj/eOx99mV6F7mk5dD513FzVJ/LnFY
         ie5EPz5LHYJz35Vey9gmIEVasQPFxRNo4EgkNYawPNlKQfYVr2x1eI1M8yNXVes2E+8F
         IoF5OxtBRrkxqfKXzXQZ5SmuB4z/71HgLH5tlCb0wJKaMeM8PCrlOllSkl/OpnUsUgX2
         mDHw==
X-Forwarded-Encrypted: i=1; AKwUvBw/+Uulg1ZfAkJB9HEa9N2AITsXR41TIIUvImAN0VJduu6XvRKFhWPCqn+kPmUEHShEtqMbRYJ8SDb0EpVj@vger.kernel.org
X-Gm-Message-State: AFq9FYLXCx8aslE8M6sLl1Vp4HkWAB/vs/+VXTskTaxboDMs+Pn27n6P
	2sgagalWXMkF8a4Ldmn6RvGp0vSTg/R+n66sFRFY40Mc/8t9Z9U4b7ribIBNGenpqFwkILPE8nt
	x50uGBUzME875jivc210Zm6lCadCmjiofZhrxSrFR4VMT5cAUBZizmLmiUAZ9djn8EoBP
X-Gm-Gg: AYBFou0il3IV1fl/lXVIImb3oDubxeKDzEJMIak6r6ZXRg/h7/SurYKcWyAqlWCmBcm
	D3uqzfjTDKKb7U4weRBE5BTBa05PxuVs+W+UDLRAeH36wGzTSlhrJADJOVcBvtpCNBHjF/tpo+Y
	PKDqjR9kPgb84Fdr1UdYabBVrOkFV2mPZwaQoEOfoApBL6uw/OXWqxVE83Jdcj7y1alXr6Tr1vO
	E+NH+c2FpcPzrqCkxmOURqbZJgx3zWrHpi5jruR1ZTZ/oXXNyavOjyJ1tZw5GSQvm9o+RqADa/K
	5ajqWV28E40r5ESJqla4YXlZd2iBBGOZtb7wgTLgBQ/jnzw2O9v3SPEz3+XzyE7lVXlKm+wgHYN
	e3hRg30LZ8s45POZxU47R0g8Xhbu6
X-Received: by 2002:a17:903:22c5:b0:2e2:bf06:25f3 with SMTP id d9443c01a7336-2e2e4b4b833mr2230185ad.38.1790744581362;
        Tue, 29 Sep 2026 22:03:01 -0700 (PDT)
X-Received: by 2002:a17:903:22c5:b0:2e2:bf06:25f3 with SMTP id d9443c01a7336-2e2e4b4b833mr2228205ad.38.1790744576104;
        Tue, 29 Sep 2026 22:02:56 -0700 (PDT)
Received: from [192.168.31.121] ([152.57.6.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5bd5c67sm758105ad.48.2026.09.29.22.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 22:02:54 -0700 (PDT)
Message-ID: <362c6465-66ac-4ed7-9e7e-f75f31b32dd8@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 10:32:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform: arm64: qcom-hamoa-ec: Add thermistor
 sensors
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-2-d9c1bae4cd0d@oss.qualcomm.com>
 <c15405f3-db75-410d-045b-996db4f83110@linux.intel.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <c15405f3-db75-410d-045b-996db4f83110@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAxOSBTYWx0ZWRfX/l2X4Dm+165D
 Mi2PqRYlVH1CnCzBO/Sue9onlkcoNs+yMDjYhqY6LKmv4LqZisqv/Y8mgp8OqVRR1rDb8PcQ7KC
 2BKNg1jq5vYmlSS5HTFGGPPH8woBOuktBTvg4klovTzHAeIjEZY9nLJ6OKmnL7hqg2yFgpdnHv8
 STj5fWsZalLDU2k+UlBpGBZuADRHSDZJKKJR+h4Bgid9o4g3oh1V3bcy1vwWJTe/wmz43+OQZtn
 xuX41KMN7CUWLTDE7R4jvYm+fNIHZVsgsph/QFsAyg4dvbK0kfU7Idbmwru59lEPnrmtmJxZNwX
 ZhLmSFMzVHyk3rWAZ3WaMjezUyns09DlEz9Xf+9qC30BBc1Ak7acMocjoKvArxloey9RWbzbEAF
 UDADGa3IaqgL1UZYKCQ3bAC8hZIDjY8MfZCJ4c8cSRzmfNu7Tf3TOWUTdjGNc3oeqJJ5Bsl1EtV
 m/RbDZRGokeoU2ArC/g==
X-Authority-Analysis: v=2.4 cv=AoB7T+9P c=1 sm=1 tr=0 ts=6abc9806 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZE6J5AxZF9eTCMsEPEnAuA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qvRe1xnp1C8EnQCzoIkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAxOSBTYWx0ZWRfX9xZ70ZBS9IUi
 eIxYbHgorET8pfeqpQ3ajedBItxUJ3Kq1hU9W/g+G8VplUAKBP1eT2XiBLXcBtoPPlhetJLDMaQ
 xtJUR1FdVS3i4FekfsDTCtxfSf05U8I=
X-Proofpoint-GUID: gzsr6TChLoSUDdhgmHSWdP6scY5vAOh7
X-Proofpoint-ORIG-GUID: gzsr6TChLoSUDdhgmHSWdP6scY5vAOh7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300019



On 9/29/2026 1:05 PM, Ilpo Järvinen wrote:
> On Mon, 28 Sep 2026, Anvesh Jain P wrote:
> 
>> The Qualcomm embedded controller has exclusive access to multiple onboard
>> thermistors programmatically discoverable through the
>> EC_THERMAL_CAPABILITIES command. The temperature values are reported in
>> degree Celsius through the EC_THERMISTOR_TEMP_CMD.
>>
>> Register these thermistors with the thermal framework by adding support to
>> the EC_THERMISTOR_TEMP_CMD and convert it to millidegree units as required
>> by the thermal framework.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  drivers/platform/arm64/qcom-hamoa-ec.c | 74 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 74 insertions(+)
>>
>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>> index 4d2ad042a7f8..acf3d7f53026 100644
>> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>> @@ -16,16 +16,19 @@
>>  #include <linux/pm.h>
>>  #include <linux/slab.h>
>>  #include <linux/thermal.h>
>> +#include <linux/unaligned.h>
>>  
>>  #define EC_SCI_EVT_READ_CMD	0x05
>>  #define EC_FW_VERSION_CMD	0x0e
>>  #define EC_MODERN_STANDBY_CMD	0x23
>> +#define EC_THERMISTOR_TEMP_CMD	0x29	/* + thermistor_id (0-6) selects thermistor 1-7 */
>>  #define EC_FAN_DBG_CONTROL_CMD	0x30
>>  #define EC_SCI_EVT_CONTROL_CMD	0x35
>>  #define EC_THERMAL_CAP_CMD	0x42
>>  
>>  #define EC_FW_VERSION_RESP_LEN	4
>>  #define EC_THERMAL_CAP_RESP_LEN	3
>> +#define EC_THERMISTOR_TEMP_RESP_LEN	3
>>  #define EC_FAN_DEBUG_CMD_LEN	6
>>  #define EC_FAN_SPEED_DATA_SIZE	4
>>  
>> @@ -39,6 +42,7 @@
>>  #define EC_MAX_FAN_CNT		2
>>  #define EC_FAN_NAME_SIZE	20
>>  #define EC_FAN_MAX_PWM		255
>> +#define EC_MAX_THERMISTOR_CNT	7
>>  
>>  enum qcom_ec_sci_events {
>>  	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
>> @@ -64,6 +68,7 @@ struct qcom_ec_thermal_cap {
>>  #define EC_THERMAL_FAN_CNT(x)		(FIELD_GET(GENMASK(1, 0), (x)))
>>  #define EC_THERMAL_FAN_TYPE(x)		(FIELD_GET(GENMASK(4, 2), (x)))
>>  #define EC_THERMAL_THERMISTOR_MASK(x)	(FIELD_GET(GENMASK(7, 0), (x)))
>> +#define EC_THERMISTOR_PRESENT(mask, id)	((mask) & BIT(id))
>>  	u8 fan_cnt;
>>  	u8 fan_type;
>>  	u8 thermistor_mask;
>> @@ -81,6 +86,12 @@ struct qcom_ec {
>>  	struct qcom_ec_thermal_cap thermal_cap;
>>  	struct qcom_ec_version version;
>>  	struct i2c_client *client;
>> +	struct qcom_ec_thermal_zone *ec_tz;
>> +};
>> +
>> +struct qcom_ec_thermal_zone {
>> +	struct qcom_ec *ec;
>> +	u8 thermistor_id;
>>  };
>>  
>>  static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
>> @@ -183,6 +194,43 @@ static int qcom_ec_thermal_capabilities(struct device *dev)
>>  	return 0;
>>  }
>>  
>> +/*
>> + * EC Thermistor Temperature (cmd 0x29 + thermistor_id, id 0-6 selects
>> + * thermistor 1-7):
>> + *
>> + * Read Response:
>> + * ----------------------------------------------------------------------
>> + * | Offset	| Name		| Description				|
>> + * ----------------------------------------------------------------------
>> + * | 0x00	| Byte count	| Number of bytes in response (=2)	|
>> + * ----------------------------------------------------------------------
>> + * | 0x01 (LSB)| Temperature	| Signed 16-bit, unit of 0.1 degC,	|
>> + * | 0x02 (MSB)|		| range -40..+125 degC			|
>> + * ----------------------------------------------------------------------
>> + */
>> +static int qcom_ec_thermistor_get_temp(struct thermal_zone_device *tz, int *temp)
>> +{
>> +	struct qcom_ec_thermal_zone *ec_tz = thermal_zone_device_priv(tz);
>> +	struct qcom_ec *ec = ec_tz->ec;
>> +	u8 resp[EC_THERMISTOR_TEMP_RESP_LEN];
>> +	s16 raw;
>> +	int ret;
>> +
>> +	ret = qcom_ec_read(ec, EC_THERMISTOR_TEMP_CMD + ec_tz->thermistor_id,
>> +			   EC_THERMISTOR_TEMP_RESP_LEN, resp);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	raw = (s16)get_unaligned_le16(&resp[1]);
>> +	*temp = raw * 100;
> 
> MILLIDEGREE_PER_DECIDEGREE?
> 
> Make sure you have the include for it if changing to it.
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct thermal_zone_device_ops qcom_ec_thermistor_ops = {
>> +	.get_temp = qcom_ec_thermistor_get_temp,
>> +};
>> +
>>  static irqreturn_t qcom_ec_irq(int irq, void *data)
>>  {
>>  	struct qcom_ec *ec = data;
>> @@ -376,6 +424,32 @@ static int qcom_ec_probe(struct i2c_client *client)
>>  	if (ret < 0)
>>  		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
>>  
>> +	if (ec->thermal_cap.thermistor_mask) {
>> +		ec->ec_tz = devm_kcalloc(dev, EC_MAX_THERMISTOR_CNT, sizeof(*ec->ec_tz),
>> +					 GFP_KERNEL);
>> +		if (!ec->ec_tz)
>> +			return -ENOMEM;
>> +
>> +		for (i = 0; i < EC_MAX_THERMISTOR_CNT; i++) {
>> +			struct qcom_ec_thermal_zone *ec_tz = &ec->ec_tz[i];
>> +			struct thermal_zone_device *tzd;
>> +
>> +			if (!EC_THERMISTOR_PRESENT(ec->thermal_cap.thermistor_mask, i))
>> +				continue;
>> +
>> +			ec_tz->ec = ec;
>> +			ec_tz->thermistor_id = i;
>> +
>> +			tzd = devm_thermal_of_zone_register(dev, i, ec_tz, &qcom_ec_thermistor_ops);
>> +			if (IS_ERR(tzd)) {
>> +				ret = PTR_ERR(tzd);
>> +				if (ret != -ENODEV)
> 
> I'd prefer ret == -ENODEV check + continue.
> 
>> +					dev_warn(dev, "Failed to register thermistor%u zone: %d\n",
>> +						 i, ret);
>> +			}
>> +		}
>> +	}
>> +
>>  	if (ec->thermal_cap.fan_cnt == 0) {
>>  		dev_warn(dev, FW_BUG "Failed to get fan count, firmware update required\n");
>>  		return 0;
>>
>>
>

Thanks for the review. I will use MILLIDEGREE_PER_DECIDEGREE from
<linux/units.h> for the temperature conversion. I will also change the
thermal-zone registration handling to continue explicitly on -ENODEV and
warn about other errors.

-- 
Best Regards,
Anvesh

