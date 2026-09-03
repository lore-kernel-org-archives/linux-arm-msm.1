Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B23386424
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 07:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419645; cv=none; b=vE5JNbTEQncY+fhLqNt2agjLkvJif4twpuZ8BVfNRPZOUU8RBNpxpXxsSkbCyvlIP/ykxeJ4e0+rjVaniChUriXKaArfxn/mMO/vFN0ysXQfHrVCZHT7kuVjg8rZjH6DfFYFQw+r1H6DFWNRLSrF66rt5OOC2tHPRdvPfST/lLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419645; c=relaxed/simple;
	bh=Xa5G4mhQl38Wew636ZQ6vmEJaM4aGAdkb3PaAexBHv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=egQMVfk5jpJ5EBQJnV1ApdGVzJewszxkRwqwoHMqjS3cXIvUWTyHAdQwHGs0u2sq+at9WFuFgV/epit5bhSlyV6FMHFE4TTZWnDGjDA9rIZxVzeQQ2zlhydXBGVmq2Vfo4opVJyadqbZJ7IFBAoQ2HGSWaoAJ324Q+Wvl/XR54o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzeMZMN6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A4g07mdi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzeMZMN6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A4g07mdi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lLFv3113940
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 07:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1tI3L93136NevpSwOUQHK1YeEJCgS9S8zFneCM0oV/4=; b=dzeMZMN6XBGBcXkz
	quikUGIqz2nAjlgzrxJXHtQuzLLNzCo+cD+JuGoszsxm+4Oyy5JvhCsy0881EOFQ
	2MwoIFz4wRzmXH0IKEmi1exXzSw3SHnAGgrebRdSFPJG2fpydax4Y/tJ0QLLz2WK
	0x24s5jmNVPUdg2GWXTvc1KOqmZeFXXterNljeU+crNguieG/u9K9OI24gQCd+iS
	JauVipEXK965O3ZNaEZuFIXRjGjcGvH9DUlDYq5itu4lLaFfET+Lcf3SkK2g3xnx
	DkyX+JuWBEiIczoSoqRzrmFvut9ifxS30fJY3iT+GNNGa2ejbLTv9sYd2SVJYq+j
	F1HWaw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjruvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:14:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494b1e35cso42697585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 00:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788419642; x=1789024442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1tI3L93136NevpSwOUQHK1YeEJCgS9S8zFneCM0oV/4=;
        b=A4g07mdihzFWp4l1lHhv2cdxmxegF0TkeBdUc/hy9+GCSYbn5uIiqigU7xOv5NRRGq
         eHYcujtWhwxZlduModiR2Kvz5cEMQXuFbeEV7JD93sr0qhm705pcUalVrUemtxh9Yv51
         yGZxLS+HSAdyfay/66bOj55DgRcRtXka6OcARhB5oWSbXUq1ntpBIDg+jZDJoHFo/7O8
         n7AMdOi/+zozOsYltMqn7O9ykr410M1vJt09Gbic7umAr4UgYb/rbq4CeE+6vlkTxdN7
         ldw3NWWwkGBmdt2KlO/6oygVH9Cc/IjAxw9qrCneIXQq00zZoND3QAoC/YaUOIujmme+
         LEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419642; x=1789024442;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1tI3L93136NevpSwOUQHK1YeEJCgS9S8zFneCM0oV/4=;
        b=nEhfmRHyuQhQ67o6LkbT+sBtm7SQt/eMEHer95vMlsfsG5W/MfNZa13yLHU/r+izkT
         1zS0U5Aa624GgtuIrb9zBu+pXXT35+U5Ph2iUAK7eLebESYJuB3vBqVCeEf8kRfp4CWc
         +y6PZN/wyWLtdt3fP/nsScp6KfBMkTZPZD+W2epvbIRXLyCgi34cGwHpCzePlsZHBexz
         KcYGVUg7orhBbgXtXQntFelkksEP9Crl3OKqGUFmbcqW8ipkQZPUNhkHPOjAxClMiMfs
         xCJSCMwseWzaBycfEDMAzItk385QeDEoaMatmdrfafwtYUYx6NCCREu4y1eJcPe86uhw
         9gQQ==
X-Gm-Message-State: AFuF++l+90GY398Mu2D6no5axNunzp296WYaEUJhoI1aKlwGmLi680e7
	f6Q/WzTVr4FYywaBA6RSiUBGP/h0w9Ge5gS0M0LH3NIBA73TJE+Upn0rK4M+YctXnvFOOJeUlZu
	Divv51ucUgxdOD5Gw3T7nKaySHn1I0B9zU1FvzruOgMXneyjR/g6Dxis/6efZhNVZxfcQ
X-Gm-Gg: AYBFou3pjGRRFIJDuqHHfNcaZlRnVSXEQ8ThHVCO0DczD4MsZEo1owch4JtTA6aomF9
	w4buerE9iKSVOPnJJvq8LKG88FKwrgQGNw/apv8zmloklpf8cZ8khP51R0fBm/euBQdEbPhXg+3
	JBp2VsUSf6UmAqPE9hpTp2AMLKqRypCoAaWb0HyzNJrjVAofGFfee8UQoeTcNTPGM29sv2WpqKa
	f4WukHudfWr1yWU6a5YUxHs7ui0oW+QA0F9ZEQmiilHSJTCDhwPOclQHyHWJiroWKyvCKcQh65l
	SPctd9WBC6u8CDI2YZTiA4g6W3/mtFVb71stS5sXZhlKRnNvgZXZXzF/OO+tAmH7MJNQrj0LtHP
	R2zWGu+RR0418kMmYF+Gaqg==
X-Received: by 2002:a05:620a:2915:b0:92e:9cb3:3f67 with SMTP id af79cd13be357-93960e022f7mr811309985a.2.1788419641433;
        Thu, 03 Sep 2026 00:14:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:92e:9cb3:3f67 with SMTP id af79cd13be357-93960e022f7mr811306985a.2.1788419640917;
        Thu, 03 Sep 2026 00:14:00 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f422ef61sm55632066b.52.2026.09.03.00.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:14:00 -0700 (PDT)
Message-ID: <be340fda-a8d6-40ab-a073-5acce519a90f@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:13:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] power: supply: qcom_battmgr: Add multi-port USB-C
 power supply support
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260806-b4-battmgr-multiport-usb-v2-1-1a6dd1e06cc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260806-b4-battmgr-multiport-usb-v2-1-1a6dd1e06cc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfXz9U1LhWlL1wF
 Aii/BI27NCf1uSkMVZWxZnQmLqQLBuZw81JS/dGwh3ovohcDG/DfbGsvzheHGcy/M5QcshGk3B9
 9222MiRM4sKVZdGfegWDVsgDiPW37kLkHS3VT2JkAygKU53EWY+7hvcYUJpPWgK2l2CebAGS/bX
 96GkltCsThAsGfQVglDUlr4I4GQHEC6f5vixtFncM6Xab2H1wpysiqh9abrzVRg+VciN1fzddZC
 yPbe6xsGLMg5H1en4Dhu/UevWLVAxGHW6/Se274lFlH+tAP68e7YvNZIr/ovO2sxyjlvF7WpDiw
 Om101o2eTr1uuEqjuLdo9T3Ja/M0BIHXUe3yr6byl3uoJPM8R4gdtkAdosqG5XPcK2yy6P01bgK
 3RsXKQ5dUES68TNccOw1kVr20/5YAtKxYgkYdlIFSb/v7KdkTPw+2NSulI1ZQHlRxiAkedSM2kT
 5zKF7myPJLtHpRTf6oA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfX9v7Gb7+v9FRW
 HtTfsix5zqVvzKHp+O/nqZWk84LP7MAY/4t0uqklXRkGq3FPYmWvygHl5d9/yikB4nsGgtS3b46
 87QV5ryV8t8mg20hpxg89q7IYznebwQ=
X-Proofpoint-GUID: FzfYgLoMz-C-iIxOvF79W46c5BbWTjmw
X-Proofpoint-ORIG-GUID: FzfYgLoMz-C-iIxOvF79W46c5BbWTjmw
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a991e3a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Qrz6jqPncDHAnAyxcuYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030063

On 8/6/26 5:06 PM, Kamal Wadhwa wrote:
> Extend the qcom_battmgr driver to report up to MAX_USB_PORTS (3)
> USB-C power supply ports on the X1E80100 & Glymur platform, which
> exposes more than one charger port to firmware.

[...]

>  #define BATTMGR_USB_PROPERTY_GET	0x32
>  #define BATTMGR_USB_PROPERTY_SET	0x33
> +#define BATTMGR_USB2_PROPERTY_GET	0xC0
> +#define BATTMGR_USB2_PROPERTY_SET	0xC1
> +#define BATTMGR_USB3_PROPERTY_GET	0xC2
> +#define BATTMGR_USB3_PROPERTY_SET	0xC3

nit: let's keep the defines lowercase

[...]


> +static int qcom_battmgr_usb_x1e80100_update(struct qcom_battmgr *battmgr,
> +					    enum power_supply_property psp)
> +{
> +	unsigned int prop;
> +	int ret;
> +
> +	if (psp >= ARRAY_SIZE(x1e80100_usb_prop_map))
> +		return -EINVAL;
> +
> +	prop = x1e80100_usb_prop_map[psp];
> +
> +	mutex_lock(&battmgr->lock);
> +	ret = qcom_battmgr_request_property(battmgr, BATTMGR_USB_PROPERTY_GET, prop, 0);
> +	mutex_unlock(&battmgr->lock);
> +
> +	return ret;
> +}

I'd rather you pass the array and its size to this function rather than
wholly duplicating it

[...]

> +static int qcom_battmgr_usb_x1e80100_get_property(struct power_supply *psy,
> +						   enum power_supply_property psp,
> +						   union power_supply_propval *val)

Likewise there's no reason to duplicate this one

[...]

> +static int qcom_battmgr_usb2_x1e80100_update(struct qcom_battmgr *battmgr,
> +					     enum power_supply_property psp)

We can add another parameter for the property and save some duplication
as well

[...]

> +static int qcom_battmgr_usb2_get_property(struct power_supply *psy,
> +					  enum power_supply_property psp,
> +					  union power_supply_propval *val)
> +{

This function is also wholly duplicated, we can extract out the common
part

[...]

>  static const enum power_supply_property sc8280xp_usb_props[] = {
>  	POWER_SUPPLY_PROP_ONLINE,
> +	POWER_SUPPLY_PROP_VOLTAGE_NOW,
> +	POWER_SUPPLY_PROP_VOLTAGE_MAX,
> +	POWER_SUPPLY_PROP_CURRENT_NOW,
> +	POWER_SUPPLY_PROP_CURRENT_MAX,
> +	POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT,
> +	POWER_SUPPLY_PROP_USB_TYPE,
>  };

Hm, no one noticed this list was very short for a long time..

[...]

> +	case BATTMGR_USB_PROPERTY_GET:
> +		property = le32_to_cpu(resp->intval.property);
> +		if (payload_len != sizeof(resp->intval)) {
> +			dev_warn(battmgr->dev,
> +				 "invalid payload length for %#x request: %zd\n",
> +				 property, payload_len);
> +			battmgr->error = -ENODATA;
> +			return;
> +		}

We can do something like:

if (opcode == BATTMGR_USB2_PROPERTY_GET)
	usb_info = &battmgr->usb2;
else if (opcode == BATTMGR_USB3_PROPERTY_GET)
	usb_info = &battmgr->usb3;
else
	usb_info = &battmgr->usb;

and then have a shared case for all 3 in the switch-statement

[...]

> +static char *qcom_battmgr_battery[] = { "battery" };
> +
>  static void qcom_battmgr_enable_worker(struct work_struct *work)
>  {
>  	struct qcom_battmgr *battmgr = container_of(work, struct qcom_battmgr, enable_work);
> @@ -1591,11 +1989,53 @@ static void qcom_battmgr_enable_worker(struct work_struct *work)
>  		.hdr.type = cpu_to_le32(PMIC_GLINK_NOTIFY),
>  		.hdr.opcode = cpu_to_le32(BATTMGR_REQUEST_NOTIFICATION),
>  	};
> +	struct power_supply *psy;
>  	int ret;
> +	int num_ports_fw = 0;
>  
>  	ret = qcom_battmgr_request(battmgr, &req, sizeof(req));
>  	if (ret)
>  		dev_err(battmgr->dev, "failed to request power notifications\n");
> +
> +	if (battmgr->variant == QCOM_BATTMGR_X1E80100) {
> +		mutex_lock(&battmgr->lock);
> +		ret = qcom_battmgr_request_property(battmgr, BATTMGR_USB_PROPERTY_GET,
> +						     USB_NUM_PORTS, 0);
> +		mutex_unlock(&battmgr->lock);
> +		if (ret < 0) {
> +			dev_dbg(battmgr->dev, "Failed to read USB_NUM_PORTS from SoCCP, rc=%d\n",
> +				ret);

The pmic-glink drivers are supposed not to care what's on the other end,
let's just drop the "from SoCCP" part.

Also, the existing way this driver prints errors is:

"A problem occured: %d\n", without a 'rc=' prefix

Konrad
