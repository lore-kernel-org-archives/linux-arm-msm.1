Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578951;
	b=Cx3V+NtWnfECYvRqzLg62mQJCXogMVxeoZbJ2q5OpYodDtnlpUmfwgXYXLIlWfv2Plwl
	 qIXxfDhylfw0VETldZLPpaggrwXHdfDQnSYsopfT9yhRKL9DUepPreIoe3jl03qLTANot
	 CHs9rSvVce/UgP9nCl7aMfzVM5BZh34DSye+TpYoTHweVDvrGgJM1n66Lq2DjJDEfo0lw
	 SyVK4KPSbV+hLx/BX+0CWjO9S7btpPHviles8MHVJpdCKW9tVjlW4+XwNsmxIsdcsRIks
	 m3C6Y5eUp1nD0Yjq4kM+Q8saDgwFBYlxz7MTzGzsi2BBPqLzuXlSTUN4LcutLPCMR3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DVoFS5UdeUKhEoUyshqUvMPNFzcB9a4hiumD1nyvvGo=;
	b=XCdD8HZ4lSTMJAdrxj92AL+nNKoimFcJZ4dcB5r1KI6OWc9Mg/NuWoJixKM0CWDQFCGX
	 W7m7mSE/Tx6OkNIpBJYgtZ89msNHrv9pf6TrEqIMHokQe9afTaQZ5FTreL8dk5036nc8e
	 gFyiy3ThEtSz/1bxm6b6WLozft7cZCgg0ztzVna/FbPbnDu+x+UoqOACFC5QChXywRNZ6
	 WE6SHvOZYOg9qTxHi1t5dgA76Tj29msN9SzHxX5ckJuf7OAGxHSbS8BT3Z3qhFqq/YzrN
	 AxKmdlKTg2friICSdQ0HIGLdtqu12tcp7j8EptrFuZZKvvlD+SaFQAqfJzniHNfu+xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kj1lw3qc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHNJF500;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71D4606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D71D4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kj1lw3qc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHNJF500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA697V117883
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVoFS5UdeUKhEoUyshqUvMPNFzcB9a4hiumD1nyvvGo=; b=kj1lw3qcgVzh9yrJ
	g5cjz2WfGS0Mir4lkZ9p+r87Yd43Dsu6W5akW4KQwJu6YU+nkuAXn4z4hvdU/Iab
	3yHn1kXxaNt9Z4r5W5DfEtXpCQBAS86GEn7OO28q31v2KJDEKU//GWOKQM1179UW
	gpgbQdpQeSTmCnYTUK7yg17g4qzFpGnn6Q/Hp/UgEYNkb6T2Du6woWrKxEnfOSLW
	G7zyfNRFgu+WXetuKpXZnSvNbdza3+JXwuJr2JAOi806Z32cKEwUujkUWryipSan
	ftEzhBEyeSVcosL8BFYE/1+dSV35IkYCnXrHIJ4+cw3RBWReni4knJVjOd0Le6VZ
	70wL3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v3hx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:35:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3960dca5so18824485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578949; x=1793183749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVoFS5UdeUKhEoUyshqUvMPNFzcB9a4hiumD1nyvvGo=;
        b=QHNJF500GXzcexmKby7RzJq1l1wR8z4kNf1rextZyMGPKmacLPaH/VLrtq89/Fw/Ca
         efJz56j0rDwlyKEa4HU3VvMqhJgX2GsBcr2VYdVeNfz1as0QfHj6FN2u/LBQdQy8S8YB
         tesAsZfF95gx7+Q7PiiYLrgF9rz+ThM862HAfR8SoSY95tsyUxPJeFtE/tl/cdxgb2im
         gMR7MM3Z3metfv1TOfUrURfc2S0JzdmeFHmnl+YHJjV8Aa55Op4AsSOySUsvvxFeCH2g
         XWv/RRPW9nGFVEGkiI4g4I6+V0y2fvwAbVNw+3kZkJ84p3dWrS83xdt230bzRPpSnNfh
         JEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578949; x=1793183749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DVoFS5UdeUKhEoUyshqUvMPNFzcB9a4hiumD1nyvvGo=;
        b=FtDl8Pjdu126SH5kYl8F9ZaRKNTQBE7uMHfrJJSDz0ZyNV0Z6zaZBGZAt2U2gTOqJn
         H87pa6ZTfE98ngoE+laqvN33WuED3EfVC6PYa5Z7SsVDJ/PTsHyoZRtM2geuAfMexfjy
         ObeCo4ZaFrDeHy6xKEVfu3EQtYnQKQgLia6yVaiJMddAnN43VUo5zod2uJrJc9QLuk4s
         2egjyIF585jnHoDHOcQbmlSeFgVGtBAHykZ1IORvv/IH0XFf5noscFtPQrvt1iXd69cM
         9bRSuOp+28FR51uE5v/91FVxiveBlYvr8nO3yHK/hrEDFe0aRRpHuc6ckwBxEufiZ6p+
         AM0A==
X-Forwarded-Encrypted: i=1; AKwUvBz+6J6VV1Qo85VRoJRwKGKfdj1Nq8VziAZ8QzcJGj0zkzj9hVZApvvP3z3AtAvyZLHMEjTXNfJMauBS+Ppp@vger.kernel.org
X-Gm-Message-State: AFq9FYI/SU8RhqVh2gsr03qv/EI18+X4mqov6N+O3QBPUVNNqOJkqmMt
	KjNhYHTp7BdR4+obwVcY6/69VCMJfIeoqlEb02xsn+y7072U+4bJwtXaiP9nQqua6VPNSkDLeMy
	wHWW0H/DyrLgWuUDn/tBbxxyEoFsprue2jWqGpxpkyXjDZog1XUTBu/5Vbn541p25uXYn
X-Gm-Gg: AYBFou2s4vRaRQxCVDYubBoA3+ttXiianA2HSoHwbQcjqHgXYQDVS9Ur4MvCIWnh3x4
	SiZ0JcmGFx8ZG5ZWcwp+QIJyhTYwrYDMjTqOLfkr00hT4LaI9yXYWJZsPD/cwSXoPsxw/bMbKCy
	ysodiidoJqUlI7KZFmvHPLZAR+TK3oxMdI8MI0RR/EZba9JoSIRgFCZWyrcPJMja89VlTAc35QF
	pmQKxukASFnaAZq3TcIxcKh41cwLYjCSa+nBkPrl7UXU+T74W7xLnVZwYO5XkHECwKzjyTo7024
	cmVMfWcz5qXR/LPnJJL9xFYBfZ0A1Nw/EbtLyklChSLURGh9jxEMbtz++llKevMCd7w3/xNTTsF
	K/6HghMaQS6Xb2Ul5cIrMrQ==
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr439496285a.6.1792578948914;
        Wed, 21 Oct 2026 03:35:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr439491185a.6.1792578948428;
        Wed, 21 Oct 2026 03:35:48 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40315a59esm695162a12.32.2026.10.21.03.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:35:47 -0700 (PDT)
Message-ID: <193e4885-9d0d-4f33-b2b1-650021413bec@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:35:43 +0200
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
To: Reza Kurniawan <imkyufie@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
 <20261018-psci-fix-v2-4-35f65b59eb9a@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261018-psci-fix-v2-4-35f65b59eb9a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX6VSrzT0rWT+G
 Af6pZLLGKdwOxqOJft/bSVm9mpr8bWrU7MSSeUGi6PtmLWvyxe1wmCaT3Z6DGjqFWgWtnawFh5x
 Gm+xXAgxXCIpey8JTR8o+vDGyqX6K0s=
X-Proofpoint-ORIG-GUID: nUTb0ESwSZ1XeFe1et0xOVX1cffxKQO6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX5HmZToSm6YUg
 xm8HOydD0G10Yzt0cVdq1tfDYUoInW8UaCZiGtFetTT/ppk9rgLttwf3FI9mypvimrD6D3vElbl
 LY5Twl2j6FhWbA4cqYD3/cbHgOMhj1Qgqsu08yOojrQdB4mfHR9L7cicHT5lvpA3IyvQ05HNPb3
 oPdRLQwbr5xBFW/6kYqtFr/7gXsdkhzX5voWZT3OVGBKwCO3PHM2QNiPPjYO+cZkkHeL08LJ99M
 2Zgy1t0igAeZzBe9vxwpMnYk9WmHBAaoX1dC6upgWT7yJ08qi6OsV1k3NydC/aQAG3YMTy31mA+
 hoStQzhd6BySH6I70aurqSIQw2s6ibtjz+gylr+kk1MEf/zPqbz5AQwWoVNhcDILWWpDbW6sHkj
 qfRJr6l3NmYU/1sdhsmpRCZYkKxF/XzrSWJ9U15xjDutR2mmScPg+QSMAEfZ8D55HUgtZ5GVKMr
 QVJHOpRAEfyOn4w4Otg==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad89585 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=VTptWAqQFsUFMNnqaZMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: nUTb0ESwSZ1XeFe1et0xOVX1cffxKQO6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

On 10/18/26 6:29 AM, Reza Kurniawan wrote:
> MSM8917 is a single cluster SoC, so powering down the cluster means
> powering down the whole system. This causes two problems:
> 
> 1. The system becomes unresponsive, even to common interrupts. Waking it
>    requires an interrupt from the MPM (MSM Power Manager) or scheduling
>    the MPM to wake the system later. Linux currently has no way of doing
>    the latter, so the cluster may never resume operation.
> 
> 2. Entering power collapse blanks the screen. When the state is entered
>    and exited repeatedly, this shows up as visible flicker.
> 
> Even if MPM scheduling were implemented, the second problem would remain
> and it wouldn't fix the system being unresponsive at idle.
> 
> Replace the idle state with PSCI mode 4 (dubbed GDHS downstream), which
> is less aggressive and can wake up from conventional interrupt sources.
> 
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---

For the sake of git bisect working, please order this patch before
patch 3.

Or alternatively, we can get rid of this one if the MPM rework
series lands first.

Konrad
