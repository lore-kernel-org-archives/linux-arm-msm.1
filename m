Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E5743E072
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582343; cv=none; b=SN+7C8ZjWJplkUDHYQLpiLjgCfle21qAb8rOJxIA8Oo9lrzCHc8OW4lceIDaOTmpFtCcr3W+e9HaHWXhEvNqTL91BXiJg3T010bLDfpWln9nMQNPnLPR+mET3+/nMnl3tR5OKZJ2riUfWad78X9WuF1VD7+XHMO1LnwaTZiNsXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582343; c=relaxed/simple;
	bh=kGzciNMWshTEHNnwURjX+K1uJYp5oXilaPWpiSqmzpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LTvI6OAWLBJc3loIxsJ9FP4Hmt1mIF1aNvVeDfDni5w/t2zBWzBx4H1MjToHMWLD6as3P5ex3Jmkm5NjtD3A1KzcFHOwXCtK1TmEXfZcfFx0Z0PWpruF1EukXGwYzBF46kLj6uTqOGFU0ZkB1YuL9jClOfWg2R8tQGPvrj78wOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oiJqgFF0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=by5yPegw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oiJqgFF0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="by5yPegw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OD9ICT3102861
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2wbMUDW3WmtllbKA6sFvejdIUD6Cls9wZjLJKYlG/jo=; b=oiJqgFF0v5MriLCO
	zzZHR5fWEE4rWZucVH9kjgH9WUxiyrbkyN1giFgdUX80ahP7rUa/ZxKNWekhegPN
	+yM3MJUsHAvM81a6DbjzQBwRA48v9bpplEKElmJVt3wAyYUYmxvzTmUo1NCuDIdP
	yzEVonDxB6unm43g8Gp0tSj1/ld2gjafB9kq0uzg3VpdOmeP9L1zZdXWgx0W+P9J
	MgaiDOTivYg2BcsmYIdcq7bbb85JWTVGh6yOsW0BQd+3pbUgR/csa/sBuJYB2BZf
	FgMvmOkHmw4G1e3UiL/wm3WtbnIYOd3ZaMnJBExOpcWKZI30j6D9sywjn+VxTgyd
	h2YoxQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8pkdgbww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:39:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52845bd815bso6941851cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787582340; x=1788187140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2wbMUDW3WmtllbKA6sFvejdIUD6Cls9wZjLJKYlG/jo=;
        b=by5yPegw4A8mopimZ9hWEKi/FcfzL+0KnojTlfNQVEF9nrXNAH5PrvtWUQY3HXFy4G
         jj2H9OVNdpQuJod1s1AduvYmW/gpeJwtbbqAbax9+rKwaIeNNAJ9BVylivvhWndRgLSZ
         ILhAfBEqPG1BC96EiEHaZZ6hYcxbls/admU62+gUy5vT3aco5lSR4gG5sspbLd8NBRy8
         QQ+wCAi9IzB49AKMiGwnKaD9JQ2HRMvC4Yvh2jXssnNIXAFtrrgAJUA/bqMJwM3R1ioB
         4WpRY9FS3nBERrJFC8MdLF7x5X7b4FgVwgGJCYRqjsJkJjxKok8U4c35CJYcN2uPMBRF
         DhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582340; x=1788187140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2wbMUDW3WmtllbKA6sFvejdIUD6Cls9wZjLJKYlG/jo=;
        b=ePg56orhNRReqr8AXD4JraEyIvyqi0vNmkXA+MI58ln6K8afuQMqRSa1BKf+FdWpl7
         JYf/zMvFeCH3Qt9NAmd2RA2aYqARPwWkMqbTyc3XMgQwoyF/hRdA/c4CF6EcwEV1g9mI
         xVmC+P5qVbjPXbfBlDx1E4Kc1UWATJG3bBsZW71bdwN0/RCMaILIVm8sA+A119RRDfNa
         O1xAD7EuYfdZ1+LVkbKWwl5uMMbSrni7GwLp2pIpjRilJn+7LzLbNNAcL4nIF6X1s+LR
         LVATf3dxb8JiV4aE0wAYBLrTILWfrUEnkjfuVaBy8ocbAM5MGEa/6oYX5MwBR3FNmiZ0
         rfVQ==
X-Forwarded-Encrypted: i=1; AHgh+RoDlRlLAyjDnj17BJ6GV2ysNVfUpedQnpg5E5OTW+5OK91X0OEY8OUXBL5Il1GnuZ+lWIIBSuzM76CP7g0k@vger.kernel.org
X-Gm-Message-State: AFuF++kK4BVODzuDYXpP5hwrft+0+7iiQD/J0FGre5mmuXVH8v5I2G5V
	TlxamuDrSgp8hahQWW5uAq3fEDdiLGIEyooHqxAybpB5NUdridUXbVA6UHvZ25RttsIwS6+OTx3
	dT22MtHFVWNRlC7BBMPhSPVgAbB4O49xGSp9fyU7lVPmtz+V5iSwtasW0GpdROk6t9QZL
X-Gm-Gg: AR+sD11midURbBK0GtzarI8O1YiQjy0vRFnskaPVQNLWnn7+tXP8N1za2S4EtPY/TFM
	ajr2Jd7vtUiwg5juO6/pGT6p5xmSt2TUEQmjccWZjst3ew/mzgNoYT/Ow5M7zOaMquDm9mut4We
	C2CO8NpVVn1/MhE5/YFlDG0r+kQGna5BhljrG0u2fEQYbB9MpD+iykHD9GD15xM9eCtJk6Hp7V3
	dynRjqBC8KpoE6LyilW77reXTAHvJFikCstRamch/w4ZPRxtYfTc+pR449t7tju6OnAv4dc5BG9
	cNE9Wb7yxVb0AO/8LDg8Ce4j52Ky8oR8VtsHKYQg8hfY67jN9dXWtHjGSZDf9pDJeEvyjbVAPDu
	JLlpOw/1vHnNNXygH35NNjJVL
X-Received: by 2002:a05:622a:15c2:b0:51c:2101:f0 with SMTP id d75a77b69052e-52df56d00ebmr199886691cf.2.1787582339937;
        Mon, 24 Aug 2026 07:38:59 -0700 (PDT)
X-Received: by 2002:a05:622a:15c2:b0:51c:2101:f0 with SMTP id d75a77b69052e-52df56d00ebmr199886301cf.2.1787582339504;
        Mon, 24 Aug 2026 07:38:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968a336fsm1341112966b.60.2026.08.24.07.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:38:58 -0700 (PDT)
Message-ID: <64c426be-bed9-4ed5-ad46-2b9c45d0826b@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:38:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: smem: support Glymur DRAM info
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260820-topic-glymur_dramc-v1-1-f714eef34e4d@oss.qualcomm.com>
 <zwpgeeapcjwtad7xyerz3bdegrtbuu2ajdqt5yjpcvxgopq3kq@cg2uvzmdtwyh>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <zwpgeeapcjwtad7xyerz3bdegrtbuu2ajdqt5yjpcvxgopq3kq@cg2uvzmdtwyh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyMyBTYWx0ZWRfX1NY4uwSC8ogy
 eFecK5Myv1a1NYQeFEuT8LoxnFk4ZJttfQrcCFiCle0OCAuM1g4R4qIfhZeCaLObHijmrWCAWDK
 K40+oMl/SV/yrCQrSzJh8o8GywN5Y4M=
X-Proofpoint-ORIG-GUID: 1HS9oIh_hWd9T9LADqK8q8LejeaMYga3
X-Proofpoint-GUID: 1HS9oIh_hWd9T9LADqK8q8LejeaMYga3
X-Authority-Analysis: v=2.4 cv=Kq19H2WN c=1 sm=1 tr=0 ts=6a8c5784 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pSNaIOjtPcsNGCKoTLMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyMyBTYWx0ZWRfXxbh41bLbcVe8
 hkG/zisPX9kbwTFyYoUfu7n/BHv/ONm3r5SOOaybH4mdpGmG2bhOjCnFf9QZximO/ICHb1h3hva
 UHP74Nr+kUjtEZaGCMeb211whaDTagBNTs1wDJoqZKyHRguV02vT4pUI8mDopPwRBt2Lu7Uy7Lt
 6J2HDiw3FHtpGOOazhHTOmbcbd3qtjTpZ89jDqZTRaAPo1GaRNC2veXu2gFiBI0z7je9Rdra9m+
 du3+FArubXkVi4WUJsR/KT9vHXiYhr7BFX7A/zJ4Acr1dlOX3WanKwbPJAaJcMKzY0EATq80pDr
 Vsjz/mgmDqDh7XcZS4f3+o94Uyss/Qdor7UdfOb3V2fKq+lOSGU9szWa+LGYIAZXI5sGIMcMm3n
 cnlmxmYeeajc6AmoutG2E9j+m4Fga55Yh076aGpJHL+mdP3/x5VHIXBSGWvbM6b+LiclfY3Ae9N
 7+jf3a+nRRKefxfViYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240123

On 8/20/26 9:31 PM, Abel Vesa wrote:
> On 26-08-20 18:30:08, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Glymur firmware provides a version 7 DDR-info SMEM entry whose 872-byte
>> layout is different from the one the driver supports today.
>>
>> The data contains 16 channel descriptors, 14 DDR frequency slots, four
>> 4 DDR region slots, a 10-entry SHUB frequency plan, and v6 misc information.
>> It accounts for 616 bytes; the captured SMEM entry has a further 256
>> zero bytes.

[...]

>> @@ -39,6 +49,7 @@ enum ddr_info_version {
>>  	INFO_V6, /* INFO_V6 seems to only have shipped with 6 DDR regions, unlike V7 */
>>  	INFO_V7,
>>  	INFO_V7_WITH_6_REGIONS,
>> +	INFO_V7_GLYMUR,
> 
> Just curious, isn't there like a minor version number that could be
> used instead of the GLYMUR suffix here?

There are no minor versions, it's really more of a "version 7 baseline
with X regions, with Y shub frequencies, max of Z channels and somehow
lots of extra zero padding at the end".

This is unfortunately a huge mess..

Konrad
