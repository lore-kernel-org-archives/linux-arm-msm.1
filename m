Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0B42C026C
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 07:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507372; cv=none; b=V4tIyLcwjOWevvIrbRawbaHn2IQugRlKnLWQW15s03l77tLxtCwsKefnohSM1K43eu19COtHmG6aao/LEGK/rYd7ZVQYQfIOraB6QH67n7yTBQLqkXu6PRHLhO+05VyScdYxe9VQ1+iRiL+D7nVEdONbnLEaLP3FY1bJy4N3mnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507372; c=relaxed/simple;
	bh=xhlkm997eTBuansl/g5BSoTZBy/eq8gMxFuXKrI4/+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B9zDe0P8RxCmdr2/ObDygRLzQtF0ew1p8tViU+vbp6oVLE4uuXkMnNP4wSH6NFzw86SEEDq9JdwnxdpOtmDBSIQpAbj3HmPJr0jH2tT6Aww2G8hR1bFDZvT/SJppYcJJsdB9nZHYs0wODxq4fKhT+tYxUqH/5VHWumn771qqQgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HtOsyqsx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kp0er9aF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HtOsyqsx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kp0er9aF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68462QAZ2750596
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 07:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	el9/GWun7bF9QXuvqr37ACTgJVtX0bMsJv7LmsaRm3E=; b=HtOsyqsxEw+hnDBy
	EZaLbTbqSbz6p0qdBQ6t2ehmmyGHnMIfcFlf+4Jr1mFoGC/MxtVObGoCAOp926gq
	45ONSPtQhBmnUyVRcZLP6uxkxZuFAREsnsjMDp+nu9YAAE3eiTWjZ/K4J7BxK6SJ
	d3T9DBekIbD5v7Q6OOEzSlV2gh228RVQsitTkEy0Y1viaSWboc4fZcYEDpdHcqVJ
	rzyfLPjutnGOqpr3MhZQ/anwp87exOc1Oex14vizp5rDUs/z0cDGAt+ZHBhCOFM/
	j8IyCJMn843YEzRTJT4t9PnDQaLulOSXkWnbmmtFegmt9lvBb1BEAA3xXL8oVcte
	QXjbyw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyxjjbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 07:36:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52fa40fed05so1355171cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 00:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788507369; x=1789112169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=el9/GWun7bF9QXuvqr37ACTgJVtX0bMsJv7LmsaRm3E=;
        b=kp0er9aFCFZAJRS9UMGBObXEzxx8QLhRkLPrI2v3hsFFolIerKtq/KkRg/OepYl8Cg
         dYvx+FTw5gHT22gh+DdkzQtbFgSEu/0bQBvM9E4znxVCbkD2IUljFtYKxCruNfyB5DVi
         faClSy+9MtImiM8jB/Jvh+wAyXgtaaRRzqRzaPdq0WHbi+t3k0BsO9V2tzuG+GQgFE2b
         2uyKnSEPTqeu7DPA561G3V/82gAtIom4yLCYSDaIe3HtaMnm9SyY9HZIO7abuiPvcHUs
         w875+HYWpi71oY+hkG0ck05aOX2LMQ8iWHSosmoFBZ6izpRQbN8OohYAqSXYRKpNWplL
         XQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788507369; x=1789112169;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=el9/GWun7bF9QXuvqr37ACTgJVtX0bMsJv7LmsaRm3E=;
        b=fjiNEogIGXwTptkTKO07UTMvE/CsF49TLYm4mNift/Zg+Jcfk2AIUJRhgfnTAouHSd
         F0U6Y1TUSklwePMrqSJYEQw31R+h6WupokaCKsHzrBAUoiEL8V3OFW3UjD9A3XLZcDfI
         09Ku3+NJ2IYJm7NXFIeE/BgYivhU2ErtA69a9sugu+86c6LDDQzpcNOdgXlAuhx1kUvY
         +2952VuJnaIIK9M3jrVQ6T/h1vjBaW83hdCmFdDP1ygWmwBf7nB+AatFSXAYH7TWiZe1
         5Vel/wDLZ6268Axjp9jW+EvRgKLxmJiCP1Uv/yYhL2rUUfNH2AD97xufu7Lo/LwEWp7t
         IORw==
X-Forwarded-Encrypted: i=1; AKwUvBxb/3SmvS/AS5s1W5LRECKp6Wi6P4YM0WZ1yLkbOYLG23iTf7c0Z1uSAWVbBS/xmsCFxBhnIubymDNMJb6O@vger.kernel.org
X-Gm-Message-State: AFuF++nE5iwfn9l9UcjGqUrGSW08O8uUwcs/0/pA41cNBh3Box92e8T3
	qPxVyVUDMha9JHUef1QxdDN7npg+WHh/mFAr7AQc19yV/JpBVpmE1Ve3n5K3LsUrItL9n5jgs8/
	7cuNjTBSStuKtwNW8JchUXmqzpNZzf1XgkAc+EHKwn4ETM/Zh6o40XatNJyh4DzK5Q+RF
X-Gm-Gg: AYBFou1x1mqwwdjI13dRC38meNJ4Y5DaHyioggj7YwkJ+gf9ksCwmPMWHsIl63slZD+
	eKLUUn/2LJqmo4qr8HUEv9AeY/i0OJotNogTUrWfBbKRCfUTT7KaO6ysg2xNDOKhnuNahC2Yf6r
	Co2MwPrjxpCzeXEbmVTUaksdA7qkWtE0jFV2enr/hwFkJTVjUAcb5tqTS96lP6fAsEA0KQ8hlLY
	R7Lbk+OBuKdF8hVxHNgtN+bQMpBNjyJIKqu6fa9YTmMQXHS+YHz2s0S24USZGIick8ol2vbEd+v
	pxrML2PJES600axWbuyoPemIT6XDNbxpO5+0VtHmUBBYN3Nwvv8F46ON1m/zsDvYXm1Bs3cAiTN
	NavdmZnBN1cVIzBWbInWiDg==
X-Received: by 2002:a05:622a:180c:b0:530:4156:8ad4 with SMTP id d75a77b69052e-5305613abe4mr24270511cf.1.1788507368681;
        Fri, 04 Sep 2026 00:36:08 -0700 (PDT)
X-Received: by 2002:a05:622a:180c:b0:530:4156:8ad4 with SMTP id d75a77b69052e-5305613abe4mr24270211cf.1.1788507368196;
        Fri, 04 Sep 2026 00:36:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e66eb790sm858631a12.3.2026.09.04.00.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 00:36:07 -0700 (PDT)
Message-ID: <b326edbf-fe34-426b-af19-912edc18ba84@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 09:36:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
To: Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260820-topic-usb4phy-v4-0-aec9d2cb31f6@oss.qualcomm.com>
 <20260820-topic-usb4phy-v4-3-aec9d2cb31f6@oss.qualcomm.com>
 <iynrogny3didip7cui3ce3yq3woaqzrr7f4aqdzvls4j4mslfn@aww5qjpy3gdx>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <iynrogny3didip7cui3ce3yq3woaqzrr7f4aqdzvls4j4mslfn@aww5qjpy3gdx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Al8GC7YTrrkJd196C65AqurUCyS4Zdsw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA2OCBTYWx0ZWRfX2/ppVJ2s7h43
 tuMze6eMG6tijkarH2uwc/m/pmraiPxgZGTFWXfFiF0ZdgtLi0+8hgYjb0jIyZVDGthimvxiHjT
 0WyeF89Z4WLbHQIphyUPCMmRItHCRVA=
X-Proofpoint-GUID: Al8GC7YTrrkJd196C65AqurUCyS4Zdsw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA2OCBTYWx0ZWRfX0BIpNHcJwEly
 W3IdI1DGYFIwr5w/zP5DWXEqc8+wM15ui27ZoRSX/vGg9z7zH9hnNsyj5d+LiKB+e+YE4MFryqG
 AvxAm1S0j+5BFj0Pqb3C9UXHt2PRRa6FFGTZ2OgZ7MLKFL0vz6fbF5m0VjVANNyzkF8N4zsynRQ
 FsrmTUsTyuE3AsUVgkWRF9//qMN5Vt6/ejQfk8A1jsF0OMiZM7qjrN5wvXztpSzmArU9rakP6YD
 3IqFbNkFFLq53p9ANSX6FaZYsZWRnUq5HEQs96V5NGdGA1AsYhpsTPkWgLplkk6H+BFT5+Ro2vh
 J/l2KCwzTeDSWX7J1mncL/VDYQ4quuPmNS/pD+wZXDUNSZxNb8HbuGMgxAN1+m8Bp4Z2epg1wu3
 ZzoS3iRJ8ORBWsrXzjfpu3wBAU72zkBxFKTkC2cayfcNTVzaZ/qynMr31J6nqq58pXpRN7JQHWc
 ojzBuVfY07DmHCgzzJw==
X-Authority-Analysis: v=2.4 cv=X9Zi7mTe c=1 sm=1 tr=0 ts=6a9a74e9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3yxzJo-rEr3QGlafRVMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040068

On 9/1/26 2:44 PM, Manivannan Sadhasivam wrote:
> On Thu, Aug 20, 2026 at 04:24:12PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
>> a flavor called USB43DP, which as the name implies, features USB4, USB3
>> and DP signal processing capabilities. In that architecture, USB3 and
>> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
>> The DP part is roughly the same as on the instances without USB4.

[...]

>> +	case QMPPHY_MODE_USB4:
>> +		writel(USB4_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
>> +
>> +		/* bring both QMP USB and QMP DP PHYs PCS block out of reset */
>> +		/* TODO: disable DP PLL if there are no active tunnels after router setup */
> 
> 100 column width generally applies to code, not comments. Comments should still
> be wrapped to 80 columns.

I believe this isn't a real concern.. checkpatch certainly doesn't care:

# LONG_LINE_COMMENT     a comment starts before but extends beyond $max_line_length
# LONG_LINE_STRING      a string starts before but extends beyond $max_line_length
# LONG_LINE             all other lines longer than $max_line_length

(all take the same value, preset to 100 at the top of the file)

Konrad
