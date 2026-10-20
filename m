Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490144;
	b=u4aiIU/6Vs0Y59BEgaGs2TYPylYG5RLExaYd9gKWW4jmCP8F2bijNHm9mW2G/pv7VARm
	 Yndsz5wn4CtB0v9sEPRQMV4K8vSXZK2Aokbs8O63fpBbLSNvqAooIGMkwJTkj6Cy0Cx4b
	 g/0ytzxtrJY+B9pRO28HUtbMJrebCluAEHHr+0A6W1MQRHDX9QKC8Mlqh/G5TCyfZcE3O
	 oXgCtx8/XzbtlYJMQtelYz9uH48XxY/5yN+k27nnZZT77KvUlLm53CoGDWTOVSQfE2WKa
	 0ClCO80kB7LOxS6I90Agq0AYJP684NeCNbjVpcntMn2TBf8ROgYZerhg4FY95jPnFhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490144;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TsdVoIWtanFkfPd5/aWmmlsNnKRMvO6g1c/00z/cnbs=;
	b=gkYdgHotATLB7jnvbAsO9ySBlnvHntguqi4OUZETNvxqblhyOVzUkUl9nXvgEPCTL0RC
	 Gt0Co6DMc3mlbeRXCwhkrXApmB6r+eIfCFXj97AYok9wfNPobaYSc5tNn/br8LC5mYK1s
	 LyPI+aEndhV5Ise0SpLe4H9cl3tOnEWtGvtaqvLbemdAvv4BX5crT2u2mxXDybEoNiLA7
	 4Gsx41ZriczpvL9yUvmI3KDEt0oU/Gkt0/d9I2j3xB72fqLmnooOg+eZnCza5MSmEBznz
	 B2ONU16NU7VbQS7wj1hAwnrxvAFytgC+AkvSNnfWDxYuIVTAZSG4o1FIXXdfu2Ec50A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oGhfbJRQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q4lcd52M;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B424C60A2601
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 09:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B424C60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oGhfbJRQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q4lcd52M
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8Tfjf620481
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 09:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TsdVoIWtanFkfPd5/aWmmlsNnKRMvO6g1c/00z/cnbs=; b=oGhfbJRQfvbeZtL+
	gRLH62ZIf4MA+U25I+PDRuPyk3QHkdugT4eAvKiayCW5npyYzyJWZSh38nfuwHxS
	2S5fnql5P/tTSZEPLqTI9Atpv5fD9QiTjXtbjFNAWs8FXqf2a7q3VOGzY1FI2GGm
	Y0o0YsmNa5osTkvuJJukEkRj2BL68WkOCY6PCvpKEalI+R+VLusX+p4W3qNsdNvQ
	rvBTV1OvyBPwEFpmx7qKaZYXTYPgRQMzkkIYl7trIUQyA/GGxGb1QahgMrtAkgI0
	F+z/DuP5f2clI8F6zUK8Gwk2tFAB4qYbpJ05CTUP9qdJ736sc90bqRTXcUYv+x7k
	B+DKNg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nsvgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 09:55:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so51765785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 02:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792490137; x=1793094937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TsdVoIWtanFkfPd5/aWmmlsNnKRMvO6g1c/00z/cnbs=;
        b=Q4lcd52Mf5jpeLmHrgE+XmCKc0GGcR0v0jygipGqHcUb6bX/bYeD3AYW/+TZWcldkg
         fz0vabmj99SdBxmC9pF3VZFNvvzTauJpdA5pJSdy2ierXBpfDdWAYXGVT45nls/bxLy+
         j6s5U44ZhdDFhUoFdche3CZdN9HzOFX1A1oi5smpQLRtxZsHWqD84uq+W5o3qR/CoNwn
         KGwXX1opecTpe3vndPe3TBtYJOeGSPdpUnll8wxdQ8tqmhu+C3dlbm1Rc7V5psQb0Je5
         gHyD9+Zh+XBKKY2BVZ7c4qTPNgMxvxPH8gyoSwGTOdOyjA3qpP6/z+GDX00mF1IjX/Vp
         7oVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792490137; x=1793094937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TsdVoIWtanFkfPd5/aWmmlsNnKRMvO6g1c/00z/cnbs=;
        b=okyHMulPFbxQguP4oqQbjqgEOff7hekXNk24w2JC/m63KFt7Y07sdqFHXc+s0iFwY6
         tRiC1EGhfr+kOQ4+gxvzHWR4xc0xi0KD7eBrhMIsoGgv9yneYV8iIcTkvZKjUFdIB9bo
         NzmLummQEP0zPS0J7onz3OElXrZLmrBQeYxUomjw3Icpm7aFqUs7Kozqxd9K9sGH4KAV
         7dln4cMufCZcNCebZ/HBC24khBq1AEvPCGqTuFnitUwgNYMiH9t6L27iGwIildOX65qG
         ep7Np8COY6yZ8uZ+I845yiv/mYiu++c8uZbofOS8RwHXlW7qIGJtGHVRwrZUFIGgA35M
         vE5g==
X-Forwarded-Encrypted: i=1; AKwUvBySRyl3Yx2dQZehqFPptH/aMPpiurs8n1MS1QShxEMpBzGblxRogJtWyfQgTiNgKWWH0IFZbJjFpKU9fgpy@vger.kernel.org
X-Gm-Message-State: AFq9FYI7Sh331v2a46cFKmJUMyJstD6+R7xmGyMOicj8N2Z0YTmwVPxh
	vHSOygGyzQy5i/jtpqcfbK8obhebw/x6Je1KXt4TANyj5okGUGviDSD8fOf6GzzgTmNAelq7guT
	2pikI9U2bSyksaQKqyjDeDxjSP725cxBxq69ugEOWhOJ123VibvtEevwF2mbkWImUYmo7
X-Gm-Gg: AYBFou2cgkCNgaBXqE0GS7oYCHBUwlkHsQdZ5xP7asH2TdBqn5usRGe9/xzOml20iI/
	YkMwCvgoXDQlq9kypfNhQD+hqLbiq7es49k9D9trt49xnXarX3/N/GojjEtCevjS8HMdJEijYh2
	ieVZFyw/uThmTW70r0p7qrgIxV4n4LkVtnqNvrLSCcA6W33UpJuQ9Yu9Nehg1YbUw4l+nW+F0iK
	3bEi8NZ/y5uZjHA46i9lY879cVz4qUT15xXOrBRpMDiGXs5EvPKBI6IJKy4mQpQT/wE+ep7Gi65
	q7HE9CwmUv+XM5W60zGF8jQ1jij/7CkFDMljTELvqYP12mlQcB1Krh0Nu1GcwF1kogbsQVocAa1
	M6/YLiZcB/tm0pVUBLmBKng==
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1820738085a.0.1792490137075;
        Tue, 20 Oct 2026 02:55:37 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1820736585a.0.1792490136680;
        Tue, 20 Oct 2026 02:55:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb4ba6sm461409766b.75.2026.10.20.02.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 02:55:35 -0700 (PDT)
Message-ID: <4ec618a6-052b-47de-8418-e0e319af10ce@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 11:55:34 +0200
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
Subject: Re: [PATCH 2/2] power: supply: qcom_battmgr: expose the charge
 current limit
To: Joonhoe Kim <26rote@gmail.com>, sre@kernel.org
Cc: kamal.wadhwa@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        dhruvin.rajpura@oss.qualcomm.com, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016124806.1789-1-26rote@gmail.com>
 <20261016124806.1789-2-26rote@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016124806.1789-2-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzOSBTYWx0ZWRfX2cy12gHYDgZu
 +dwcYccLxT8X8gOyZ6Y2URQWy9CmWz7qF0xlFuZh/6UNUYOb0SI/de+XsHfHZ7lReNBetnZixLO
 KRyrxNInx2gFNijeRjIcaYCJZ0Yf+OY=
X-Proofpoint-GUID: F-834xXZrgYY8KDswiAWVoGEGs4TIkS2
X-Proofpoint-ORIG-GUID: F-834xXZrgYY8KDswiAWVoGEGs4TIkS2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOSBTYWx0ZWRfX7HZZZUpmqep8
 RdJ/nzmqQ2gDN56ZVAJ6Ce7pUIHGagnQifYc9yCHzyJXe7zUK6FJcYU1Sw5sm0navFuhBgBzRo2
 WJBsk1gqR0us+w9kU/qFdyTVyAjQfGVDc5iR7Pqq5w87Az/sGiN2Bl0eOlvyOrg8oyoW2HRO/8z
 rjYoh1kijw6u4lW8jqwMrjB/RThQTq/SQGVkqidBc9bV4GQvV5KQKu8S/n5wzCtPwIpecqvOJLZ
 bpMfqyaz/jVYnjpheMLfW1o0d0g5HiQUnqLquU/0MCCQwWx4zmUjFMdhCNTsUQZyXQQZ858MMNY
 5vcHl3loSuWd29DnocVrPWWLHD1w+JHjKRLnGpKy4/eY01sMpGTol0DSI2AaYDQ5Y9ziCusHB0Q
 kATXn/7uJERg4OPa4a3bbX/sSQICEcCujPDDrMlA087WcvwEPuHTLIUNkLffssXluJCRz3ZsQ+w
 jXtXhc3Fs4NbmG/ipBg==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad73a99 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=CtmeqFu_9xN5vWxN5BkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200039

On 10/16/26 2:48 PM, Joonhoe Kim wrote:
> The battery manager firmware takes a charge current limit in uA
> (BATT_CHG_CTRL_LIM) and reports the highest value it accepts
> (BATT_CHG_CTRL_LIM_MAX). Expose them on SM8550 class batteries as
> charge_control_limit and charge_control_limit_max, clamping writes to
> the maximum.

[...]


> +static int qcom_battmgr_set_charge_control_limit(struct qcom_battmgr *battmgr, int limit)
> +{
> +	int ret;
> +
> +	if (limit < 0)
> +		return -EINVAL;
> +
> +	mutex_lock(&battmgr->lock);

guard(mutex)(&battmgr->lock)

> +	ret = qcom_battmgr_request_property(battmgr, BATTMGR_BAT_PROPERTY_GET,
> +					    BATT_CHG_CTRL_LIM_MAX, 0);
> +	if (!ret) {

LLM suggests to add:

-	if (!ret) {
+	if (!ret && !battmgr->info.charge_ctrl_limit_max)
+		ret = -ENODATA;
+	if (!ret) {

to prevent a possible zero-maximum value coming from the FW
from messing with us here

Konrad
