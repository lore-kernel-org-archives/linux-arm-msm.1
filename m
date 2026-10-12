Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0E738C2A5
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 02:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791773550; cv=none; b=dn5SerXa02eukxVWRBVeNqMIDtd3cPJs9WFsaVSJ/z/mw3EmtIscATcepP3clhjIPsgxcTUlLl3+4m5Yp5nrqWBH+sOgN5tUFPLdHujcx5fHauNHalmyCZwp+gAnGzrHw9SZnvZcXjUE/L+OaKXyPmpfxwlFZ6L1p6qA/AjmDts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791773550; c=relaxed/simple;
	bh=c1bq/qqkjuRGWjHR9UcyqCsfWN6iu6XHZr6qBKD8ouA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hsoyHbjt0M/arq1fRSJVhY2UlLS/5YkoIccXX3+0BZyFhuEkJxzG7kKT1Y+h1Kjzi2+KjEWol4uLkBQr4uiexbw5xuJ9UM0ED+inQpMKlp0RE/uoCHwOqrks7i0Y0s+0nn8ZFxkVes9ll1Vakb6q8R4KiyL+e2wBgsEi6mx98LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P6rqp6Yy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cXr3saiJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P6rqp6Yy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cXr3saiJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C1lFbW915926
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 02:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJbREqwsQUUO1NfreZZnhUkKL1+aQh3D5/8AoPrzCmg=; b=P6rqp6Yy2CKdpa4l
	yjj10dDeodgVAgks7h+nP+wEK1O3d65zjptYwzVk7WqBwuli3o82TnFd332GwR74
	B+k4R/frn0OZX8dI5I0jPm0IFDauk/ari4N97AUoQS7T6NADO+h2It/m7S+kZCkW
	9bBlrF72GpHYEdx3GxOxN2HPquKiye0r/8hU7fbVs0iwLdmLrxP/g8tkG3JOFlRE
	tIcdZw8N5vuJm5L4NexYjjIp3GhwR3BoqXvgT1upXwBFqEma1c1Iv9D03TUCcs09
	N0KSAs1Q+9rM55olerqkwuG7VOjYV4J7lhtkdr65ZhehGkXYNMVF2Q3u84S6om8H
	Z+siRw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dk24e68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 02:52:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e80ef3e0a3so23243115ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 19:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791773542; x=1792378342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QJbREqwsQUUO1NfreZZnhUkKL1+aQh3D5/8AoPrzCmg=;
        b=cXr3saiJITZDuV3B96MyNR9Y6x+aG4Ci1E6VUJLkIHzwYBVwLKwYOk6159Ok0VeYyu
         j2xy7Pgtn31snd16jHacjWLZGZ+5BFfuazZBIxOP47P8P3YIDZErxvorK4n+IwrW0T2u
         D77EEBp+PTNPxOwR/wuEZLEjTxvn/AsT54E94zHjpvNpCFQpThxGzq4Voh2dzg/1ZYiO
         MdbySvB7theQOagkyajtLx7+Wzy94up0JD0dOvJtDk+45TiGMhxxgbFhjLllu2ypXfG6
         hHhaA3qw4fsEJ6Uusk7Iq26lPwkVhK0KLcL7uKMCHlTvXV3tt3/sMi7FKe2ql0XbheWk
         jENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791773542; x=1792378342;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJbREqwsQUUO1NfreZZnhUkKL1+aQh3D5/8AoPrzCmg=;
        b=Ke/W+FTdOUY0VmG+rM1BLWQHceun1+WEEYi07RB18uaPRIKnzUuccMoVaGIgsjJeWF
         d4gPRMNFJC4pTOt8feH3dXAbP4LCd02xgF5bV8AkRoMhGrrpGE16zDas44ogt9WLxKTg
         qGvWg9diibevVEper3rqozC2O3uo32V4bf5AdsaCrzY4lIiATURL5vaX6cB74yEbEE56
         zt54EXS5kwiVZ90EQyzfpR4T8MVpFmQROYJ4Yv/YLaCtiXcrW1Vy2wXU+50rWYrrVCaN
         GrJKSRThc91m5f5slgg+i9MKCbjgXqJhU5sWrHYud0mMu7zIHEjdzHn51RTKwdRD8cfA
         1ZXw==
X-Forwarded-Encrypted: i=1; AKwUvBwevQx/GMBNa8A/izF+k7VctKtrEVLlINGy5p3yAgB6z4dDD7ye3dHal22jSrRjv2zpJSGcEQD9BZRD9o9X@vger.kernel.org
X-Gm-Message-State: AFq9FYJg0utd2bgGYwA4ILZw+hO8zw4voKsBFZiNQE4uUEQDFlkLQWVk
	ld/9mTXMlr7W9ueYZQHjQbInFeRPw5Q6mFtdPgp5+XH7yirz5KXm5MUU6ZkyK4NQ4iptQ5Fhkbj
	P9ERpMrZc5zYbmMBdU3kIv5odKW4BRc+fUc/QBlhaIEDZvuEaBfdatZmRfYoM6BHz6PBeScAv0U
	bh
X-Gm-Gg: AYBFou2RbVmlcTst1uvjJVnhNqvvr4DxQRJXsl8FHII1VKZu6pD2yWZgW/t5V/dqzna
	oO1aLVXWJxPsKo5xU4FrKyvE5SW/FNiv+VGCkhJ6fHgXM+LoWP3SdVUuaTOA04PZFF4H8gqWtJK
	Nu9cuYwj1x3/2OnccnRb872nGuvYZHQpp7OHLsiezT3hiMkMcY/QUNkdoB6PSWq9fcvwQsh7Jkr
	QFiWLEWG2ztsYFFXCEZ5XmpJ6961M7LWjFo90eVDwm8I52uiGjSp8z5FiIqeZBBx7VqpufU3QxA
	uxOOfmCfbVVPtU1HU4FxtoxhgdmPtbcILz9iCFiD8UlV9fiEntYIproo7Lu5BIoGuP4DjpWQqNq
	ec37YPJSsBbsZllktgaJpAiCAV3d2oYo=
X-Received: by 2002:a17:902:e847:b0:2e5:e1e2:21fb with SMTP id d9443c01a7336-2e842ac8aa0mr79892155ad.37.1791773542141;
        Sun, 11 Oct 2026 19:52:22 -0700 (PDT)
X-Received: by 2002:a17:902:e847:b0:2e5:e1e2:21fb with SMTP id d9443c01a7336-2e842ac8aa0mr79891925ad.37.1791773541669;
        Sun, 11 Oct 2026 19:52:21 -0700 (PDT)
Received: from [10.231.194.200] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8202sm35146905ad.51.2026.10.11.19.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 19:52:20 -0700 (PDT)
Message-ID: <c6c45288-1eff-420e-82a0-db9d92286db5@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:52:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: skip hardware rfkill setup on Microsoft
 Surface devices
To: =?UTF-8?Q?Fran=C3=A7ois_Roux?= <franzelfranzel@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Dale Whinham <daleyo@gmail.com>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261006062728.45007-1-franzelfranzel@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261006062728.45007-1-franzelfranzel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yUIgiXbtqDgemkucM2EVDTB_gWgMfb8d
X-Proofpoint-GUID: yUIgiXbtqDgemkucM2EVDTB_gWgMfb8d
X-Authority-Analysis: v=2.4 cv=E6hYNqdl c=1 sm=1 tr=0 ts=6acc4b66 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=4vkvQpwsUkj-1mQPOeIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAxMSBTYWx0ZWRfXwtzH8jMxD0Kc
 UDzZZ21oJSBz+rmRJHEFFqkLK3eczNwsbTWun4daX0ARvY/e6TSFCZcWFHmndqugaw90IOujkyQ
 0hLKhhCPZcAHy+08oNG82OFUicxNdvqo7yZ+y+dkFertX2KpDntCnvFsKfevtRBlgBivfBVDHgY
 L7qtlUHdwotqW+mFSySbEF0lUiSTKBROZHfurQUJoCeBXebRrGgaUmFWfMvhooAa6iTnK6QkVZ6
 ++bEG0HNroU+S4C+4lSMXaVgh9TYGyaiIMiWgPhxWlTLueX685l82zOHYdRWNbzgW24bz5ezgRj
 yJMWVoya0OPTiEZ0IvhpT+2DmWFyjEjgUhdOvRVeCd4ANgK7z2cFrPjJKdAhZmmOuzOHaJTySEr
 LUQJ9Y8xUCZwO9xDeZq0UxBtBh2Rdi8jV8itUVNhvjUcK+hV47Qbt16hTFomQ9wsoARKjLNwRcZ
 dtGAo403bhBibAifpBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAxMSBTYWx0ZWRfX0h/0nV17L/J1
 bo9VzTsgQV2QFMP69xxxzBqikRC8uHEgdLAiyefKgtxLvyh+uMQiAbjbeA5QzfLQhJFCrSPmmpY
 +bUABXHd8GXMAxiGymq98Rt3KFV1tqk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120011



On 10/6/2026 2:27 PM, François Roux wrote:
> On the Microsoft Surface Pro 11 and Surface Laptop 7 (X1E80100), the
> WCN7850 hardware rfkill input reads as "radio off" and the OS has no
> way to control it. ath12k enables hardware rfkill handling, so Wi-Fi
> stays hard-blocked:
> 
>   iwd: Error bringing interface 4 up: Operation not possible due to RF-kill
> 
> ACPI platforms can opt out through ath12k_acpi_get_disable_rfkill(),
> but DT platforms cannot. A DT property was proposed for this and
> rejected, because it describes what the OS should do rather than the
> hardware. The suggested alternative was to handle these machines in
> the driver until a connector binding can describe a broken rfkill line.
> 
> Add a table of board compatibles and hardware revisions on which
> hardware rfkill is known to be unusable, and skip the rfkill setup
> there. Other affected machines then only need a new table entry.
> 
> Tested on a Surface Pro 11 (microsoft,denali) with next-20260929,
> booted with the unmodified mainline DTB: the interface is no longer
> blocked and connects. The Surface Laptop 7 entries (microsoft,romulus13
> and microsoft,romulus15) are based on reports from Jérôme de Bretagne
> and Dale Whinham. I have not tested them.
> 
> Link: https://lore.kernel.org/all/2ixwny6hzumlqmok5cjwutvtk7nzmx4t3dhxc44ao4l2u755pj@n6m7jyxf2o62/
> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
> Assisted-by: LLM
> Signed-off-by: François Roux <franzelfranzel@gmail.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

