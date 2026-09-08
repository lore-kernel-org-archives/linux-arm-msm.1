Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD474FB9A7
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 11:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865329; cv=none; b=M4BDWz8HqAhSsTonn7oc6TkpyZeiiEPXyINdj8ulwoeMcS6JAmj5Rm4McOHbWzjPUi7neQTfZOLHe2z58rZkMvEFDuNw7Muiqo8Y0M+F8GjSF3WUjI3gevjn3kY9lreKQvCViIVQGJKYclGn/9fNrbBWNpncUMOwvIrjNGyypNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865329; c=relaxed/simple;
	bh=S08Bq+rV4z/Kv+f1cb6/mJhoE1ZiaU5y1otKl0SIY5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3FtBq62y2G5lAoIG8n+pfmLPEbDXWa+ND+B35+DdgQysHRsBYQecOzemQeeIOFgshDi+s/AVNorkY/OjAZdtmFTboL5sfsx7Yu7ZmVFqluABhJRStrb5kxx2TTuy/Hx/LV3HSF1nv03mIjOrN/1K4XpPlPEyfCzl+cvtW5Tgho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7yKtaBd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iUw2re0N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7yKtaBd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iUw2re0N"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688ADoBP2698530
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 11:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S08Bq+rV4z/Kv+f1cb6/mJhoE1ZiaU5y1otKl0SIY5g=; b=o7yKtaBdaCxH4nN0
	VOUWEwM8q2MMaMQ4ISuaKAlmS26Ud5t2akywVqneFO3zXLCblHCFDMfjd3GNLYOQ
	34ckGPXjdk8N0xkmmKmrurGFgqdq9CRrQr/xuBjMYvcA/Bq9HA4WbQJ4QJUVN2j0
	XG4P9jDUUyImectiyRsYH/d3NrdOpXBGujrp+0yOuSEWu2joJYisZT3KqrFbTun6
	lsmexUWzwgQHgWI1vECCGx/GjKO1BK/b9kPDx8PQrJN+RGcgvqmv4R6dBy1Vo1gM
	zfxTaMvvkvB7k8wIdfcgbgB+997Yzfqonwtv+HqVgA3ZmurxTLAoyxQF/SgwGr45
	r6ckFg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rrk4px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 11:02:06 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738be9df36fso92531137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 04:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788865326; x=1789470126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S08Bq+rV4z/Kv+f1cb6/mJhoE1ZiaU5y1otKl0SIY5g=;
        b=iUw2re0NhoXUxtgNKsJpePu3MBPl/YsqlsJVhUGDO67PD/HFiUh+XptxMG865tfPNB
         E5yXMEBU4z11QoOLDuoFOQ86+TDE6Puymr2On2jeXSd+6FyGbc+Tap6sVhS8muHwYTDe
         Y/60eiHNEKOfDiS6BFdNCQgVA2WaI+sQepGmnX1oLl5168OLakoyJCYYxpweZISTYAq7
         SwbeAGL80zpG2gYp3fAe/81VCfc+AG4svJyJmZ2L+fNmorDYXZHOGFftdDSvnu72C9Vi
         9vkcjw5USMcTRHz/jSvKmhnVyK4AevA9fxKM/ICgHQhExcovPEp9UTog6JCePN8d0F74
         BAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865326; x=1789470126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S08Bq+rV4z/Kv+f1cb6/mJhoE1ZiaU5y1otKl0SIY5g=;
        b=grfv28/JVauKox2mg75KxTemdYe3MIwSpdX+GI4079R8sa7haZeAQ/tvKplP1ST84v
         Wk9/jpZ8JhwUT8ESEAEO4KUWvvYq+m41/lvPATTCMQlAJRy0wkgct7I7iU77/weWjA+s
         bJlO2OGrxbfKvn7lyf1xbpqRYwEexUdCRHACxR8Td5JVJ8E1uOOEevoIyhxZLrMzZg++
         2d62cR8RYhvDyKkKte5UCHxHAie+gTrLfy+fw476iNxlgtTgzfAmsdnBhASsL1zdR+VF
         xAZCIDb599uSV+JZCdy+as6lZz5paJID9h2cLAg30pRtVjckD6JdzF3ek87ug5smLxYp
         JRpw==
X-Forwarded-Encrypted: i=1; AKwUvBwq6KRQDs/OX/j3NY9jxwxStZJDkH9STdPIGx6UeOJpdiyLi+J8e8n0uHq0uPMT/Cz3ox40x/nzn1xR1kuB@vger.kernel.org
X-Gm-Message-State: AFuF++kW9082H6ad33B/CGF9G97lznDfAVikAysMHWtw/LPT0Gn2dx1r
	xU9FmXAsrcOlUmV2vOdYTeHQyz435qIlZZWReNi2F3L39utUvnfdYWUgFkn7ky7ykPnz6STCTQd
	JzC3Wb8r62npWBvN6NQmayFbLFTq6zkT6KaRFNyk013trQ7ZSQBVrYuawtdDJ1MOoUFtS/finoB
	fu
X-Gm-Gg: AYBFou0WrjDiuyQ/lhTwxZV84xFqh7fEF90DPHkMNi51XAOpPGQB8yz1ymF0I7Rj5dI
	Wb90/cxzxXDqYWaH1z9yRVQQ/6/Tp5FIZ7KDK5Q4IYKgvozA3TA3FPQF5XNUdDItljVIG9xCAb0
	LpouNDautSHBQOmoNCO5qGOnzO3rws/I0rch4URG2ld9khQ3exMy/eE6XILQMYrG7aC7YlzoJsi
	vJUO8PJo5DxaoSQc+ZmlRt89IGpvW79J3SlSuhOczII3xQUNrduILL5BbxvE92UtrPBj/5bklpi
	Oy8oPK4MDYL0mSVhoORmm3wuXO9jy8RbhEWdoS7SAJ7y55lPSj0VvoavMnvska+9X6DgSQ3PIGw
	9u1WiA0FkBnKV5/XgurwFKg==
X-Received: by 2002:a05:6102:534a:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-78a4a6dd842mr3144947137.2.1788865325795;
        Tue, 08 Sep 2026 04:02:05 -0700 (PDT)
X-Received: by 2002:a05:6102:534a:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-78a4a6dd842mr3144904137.2.1788865325270;
        Tue, 08 Sep 2026 04:02:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d501662sm607243366b.23.2026.09.08.04.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 04:02:04 -0700 (PDT)
Message-ID: <47344b6d-d64c-43ef-9344-0409a434ee44@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 13:02:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Add MDM9607 APCS IPC
To: Dmitry Sinyavin <sinyavin@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908081158.2399852-1-sinyavin@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908081158.2399852-1-sinyavin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDExNiBTYWx0ZWRfXyBVjtqU1yLk5
 C6iC2y916r5JeBnFp+SRZWGR0EYwctLJbS9jixn1NY5TaPgQKZkrpAJoEXlkl1IJtkWtFfih2zu
 7S+HAgquhXcvsWdEZkneh0UZP0WzO3w=
X-Proofpoint-GUID: jvRZIVV4_delteWunxHigjp1iMckeTdy
X-Authority-Analysis: v=2.4 cv=NsjhtcdJ c=1 sm=1 tr=0 ts=6a9feb2f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=3ovIoLsmiQdKh0zOvnsA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDExNiBTYWx0ZWRfX68IxupoTuz06
 IZkVnxdWxkgiK/sF5odo+i418HcjGfmGgNklSJHbAbGrNtGyMe8XUVMZtP+2wURJphfGq0DoMed
 kdPUETf6oLZ7wHPz2SsDkJaTJmq+Nrn2y+Dg9XaZghtMcxpzuEebR0laqLjnjhwKDyIFVS3/6QR
 O1vdgO6mD0JTp658P08Jo1DTi4sQlH4EMv0hSPTxAeJX6L89cg5v2MNr/m5eDdgqQVCY2ftBOXa
 7duyEZEY8JpkjPY4LFEMIVzD8QIhQ2+NxJr2Xxa5ZgSH+iPiPpDnq47x2z9FVY9myusXmOOkBa9
 qQtb9/dpaSniF6PgGwWhunClN5gyv6mGPGXdqDR8Wni/lBEqN9375zlnBwGLex1OlQt4AIMDZtj
 Na9+sEMREMFtqt10I5efBWGRUuRRgHBkYIP+XE5AefnLOaJtQsR2zUpd/uuhMXvqeWKxqPCfP3r
 bOb6DJ493X/x5lumCWQ==
X-Proofpoint-ORIG-GUID: jvRZIVV4_delteWunxHigjp1iMckeTdy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080116

On 9/8/26 10:11 AM, Dmitry Sinyavin wrote:
> The MDM9607 APCS IPC register is at offset 0x8 in the KPSS global block.
> Its CPU clock controller is in a separate block, so the existing MSM8994
> APCS match data can be used without registering a clock device.

Aren't you going to bind one to APCS though? IIRC the setup on MDM9607
is somewhat similar to the one on 8916, although naturally a bit simpler.

+Stephan may know more

Konrad
