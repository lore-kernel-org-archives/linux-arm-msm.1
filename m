Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346D735837E
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 06:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787120908; cv=none; b=RfMzwWrWBTXbLQpOkrtUZaHiQRfu9wA79RiiD9SQTc7iDq45PKpJ6gSE89PB2sDK1bIRITCOJgvHOvNo9kEO33UV4hcJGuibYMaKMsxgotHV9DKAzcQoSvrQ1ITL6tkp/Qv2n24m2hOehu3uQZ8ZplaWN5z1kt21HQQnIBGq8tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787120908; c=relaxed/simple;
	bh=9NsXEUlnH4j7ADwZDbgWZ1lVjhtDEdNYgKwpwi4iFwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dkNDIriAkCGhhHW2lJBKbzMfCcNYhehfBd2xVBtB3oAkaifiFRNqQ+9gWq/MAxChh3PcXmofvTkQDMUt4Jy7A/PpTN2tEPYowkv2y8duoJ9196f8wqoRb/IhN4M7c8ntn09Gz9gYljOmPyc5MM5ajAZptdrrnG+plCebP44pZDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0U2L1Bg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G91s3qQv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f0U2L1Bg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G91s3qQv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5IKUV2285587
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 06:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hv2CQMZRu/930lUMcg8A3Q7wtJR9SUi2cZhagdGpK7c=; b=f0U2L1Bg2WopJlby
	iaQAC5/AYgpbUThO5DdZBwy4zsPMBES1Rcmkbv2G0por3jX5sddEfbzjas/PtC0B
	PXxZfwfMhdkM7PumvjHJU/LKsH3iENAKmBobnYTUKloLVmj9hjMigdNEFm8MNMjV
	36XHFdF5cGnAmCOgeOpVDFCxqF3+QPISXzEJCb2xULqvgWE1ukz7sPAQxx8TnJgE
	Ora4xwg6Khf+MqT4/DeUAGLL49mnl4LrbHpjj39rRHLqf+SslmzD5Oa169ZtynH4
	GsqxmSlXg6GvTTdsjRUA7g8r8eMe1/yi+QIGzDpUnD4UWLEpiwSzkAOqops3jwYG
	rlz6aw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfk9p9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 06:28:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e375d9736so716849b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 23:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787120904; x=1787725704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hv2CQMZRu/930lUMcg8A3Q7wtJR9SUi2cZhagdGpK7c=;
        b=G91s3qQvj1Lc+4n2akdnW4kUo6xrLRW8zSJIXaWsR/B786ahZA4c6mMVjHfXunNIKw
         yT8rG/OAVMZj0EnodW7fEP9pXGSLPanbTs7XwLwPR0aG/b/yeqPpYJXjqFXHnfN5/wG8
         snnJOij6f66+N3UPcjwqkQ/RiQBDBYDLMw8TTbswXBk+hwrAUslcUccLTU2qt38AVoz9
         KNSUgjrP5Kgeir6AOYZi4pNbUzbj+xdwQB9mWpcE4HYHUfIWcp7Bzg/wPV9mM6gRI2SA
         TCKF1TUVA514V7hXkne+5pO6c5Hx69NijZ2GqtgCmnYTE4ry2vZ4iyGiaWOOpORZtffC
         Z0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787120904; x=1787725704;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hv2CQMZRu/930lUMcg8A3Q7wtJR9SUi2cZhagdGpK7c=;
        b=hc0JRF1xF5xRfISN5M+fwIJaj6lGamN+tVr5/ZhLNy111M3kfwha7S2HOrx1db4yV6
         +AEqEvULFHDPO0xLZ8N6JSf0GDSDABwM9tm6/Pxrhu/JtOxTmkkRyD0o/gT/8vYV9kzn
         2scTwITHPk9QDDT+kAB8E04yoyii+rx5V9NREtyhcpQSVk1dvckNHAthKeh0cLvEBuaN
         y2QClABM8Xz5anJ2iLM1JRYfaMjHkvSRzWDD9hINsyQewudOZTrMclBoGexe7pjfhDwd
         oKHYdWwyk1AlrZR+lZNpnkD6z4jXW9MhFDHpfbpxLYOLv7rT0363nvOJgFSLvYjV+wtl
         oznQ==
X-Gm-Message-State: AOJu0Ywbf9JIoKFfj00aacSzn6MLtiaq7SV1rtn72EiOnjvQcMU76nqx
	gRz6eixKLnyVmIMOEW8kzAmu232L1OMWeGHwPSOlAo2CGjOI3oi/krA/snfxGXlhWYp5ISs6kky
	RTwmn8twadmqIhKlao7Q1FtXmNEMpCgWZBlzJtoznPR8Rf7rzwlKwrCEdgm1WWpV1sJ/h
X-Gm-Gg: AR+sD10kZOiZZtdtBXvkTyd5WIhnhnE0DPkd11zsSF2QvBi+IeEF+YQrjagzlQ3XUwD
	U2+82TKhklaoVhHS/q2SXk4FNIIyl4AchR707ewawNss4St/rJqs5iidGhbgrvqEEOfFUkdT6Vd
	wGCabQK5Qo2Bq8V48+v3gJgYHrLyIrdCW4tqAK+LlXYDQGgfSQm6ZYMZ6Jwv8t3OTziUBAVCXp3
	P8ey+KcvP8lefhHTYfXNESAv5rr9PpZlr0dCbGgaeXCBpr2Z8ThXAAmJOO5sNl4de0M3DzrcL3b
	m0reuJNIXN5l5ghkrEY+txXJ0Qv4GE86M/+NL3MgIBlcSSknECYpo8QVRC/5Z29TCD3DoOpcTdJ
	amYOIwSoDFUm1OKHXX+YKeP6bLrsvydMB6G7BljTKjRyIeFD4OeycG/y4AZAcz9Hhjsv5JA==
X-Received: by 2002:a05:6a00:94ee:b0:84e:e741:174f with SMTP id d2e1a72fcca58-851d37f7928mr3454101b3a.7.1787120904031;
        Tue, 18 Aug 2026 23:28:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:94ee:b0:84e:e741:174f with SMTP id d2e1a72fcca58-851d37f7928mr3454054b3a.7.1787120903627;
        Tue, 18 Aug 2026 23:28:23 -0700 (PDT)
Received: from [10.133.33.191] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc15543d0d2sm245726a12.8.2026.08.18.23.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 23:28:23 -0700 (PDT)
Message-ID: <1a2f89d8-3c9f-4316-a2ca-e515359b012a@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 14:28:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: qcom: Add Maili SoC compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260819054203.61385-1-prasad.kumpatla@oss.qualcomm.com>
 <20260819054203.61385-2-prasad.kumpatla@oss.qualcomm.com>
 <9cb0c647-e1bd-40c8-a1db-7a0f6382aeb5@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <9cb0c647-e1bd-40c8-a1db-7a0f6382aeb5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PoGjqQM3 c=1 sm=1 tr=0 ts=6a854d09 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3TlOhtAxTlW9CNtfbbYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA0NiBTYWx0ZWRfXxufXjDTLsdF3
 lxlcE/ULCzkwxlcmUnHiGwLTAQqgK7OOfaz3Sv1YrZqws1BEY2/rv6FGW+KFqcD5D+jZvxofTzy
 vEio5It0xWakCdko8mdKcPOQw3zitNnEBDT3rOmN+MfpTLiDBhQAxTpxv10ahi4dJkj3GuIHGI0
 DJXs0XTxbiOzb3uoSG+Qj02vwjG5CDJ1l+CNkTvuJf39hEfr+efvcb+1zR2hkZnVipgqlkIfh+u
 9B7e6EuXuqw9qpxQNa+NsD7nXRv2Ukv0JyjnaItsuR/VwrYcEYys9KomZeSMpw7V+/HAzaCM8xw
 she0+NH8YmPJxpaW1xMObBCvHPc9qboM4ZSWHDBcJzyqOarUlC8JgF3L5w1ZhbkXk+O0BVt1ZCQ
 XInIun+nyFRrN16W48sVK0HqEt07P0sS8xzWlysZmqtczfXK68IoJ0Lrh0b0ao1ve0zuyAvlP7A
 RIGMMPQeR34KOMviAsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA0NiBTYWx0ZWRfXy1or5Q87BApm
 RWWmg/lyuWFlLPAj6Hs0SI3gWMseruJWoQdjJZ9diYUH34eCI3M5YAGmru39nEJ0KQCRR0OGq3D
 hbwTrVtSQ7bSGXhpXB1mD6dK/WQ95LQ=
X-Proofpoint-GUID: tm-r_uJ1IiSSJrWAZxkrgo0NkhktzddX
X-Proofpoint-ORIG-GUID: tm-r_uJ1IiSSJrWAZxkrgo0NkhktzddX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190046



On 8/19/2026 2:09 PM, Krzysztof Kozlowski wrote:
> On 19/08/2026 07:42, Prasad Kumpatla wrote:
>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
>> Add the qcom,maili SoC compatible string to the QCOM SoC bindings.
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index ff8a35df7862..00d9a493fe76 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -175,6 +175,9 @@ properties:
>>                 - qcom,kaanapali-qrd
>>             - const: qcom,kaanapali
>>   
>> +      - items:
>> +          - const: qcom,maili
> 
> Heh? This cannot go alone.

Keep only the SoC compatible string and exclude the board for now, as 
the latter is not currently used.
https://lore.kernel.org/all/20260622-brainy-rapid-tody-dd7c3a@quoll/

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie

