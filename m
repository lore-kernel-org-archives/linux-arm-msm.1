Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D790A35676A
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025547; cv=none; b=XqWtGyW5W3P1uKVEwRY9Kub6v1HsCmvCywz6OqkpKVCJ8iOmJBT4h2JxnQcITjr0gK4UYIHIDG5AMs/TRyGhr6B2igyiceJ+0B4CjLD/T3v5d/EAapl1iZg7lauLXWQi0ZnycvY9zUjZXCchMw8EXapgEllphqUJyN9K7rGQz4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025547; c=relaxed/simple;
	bh=YwG3ShPeEoDdW/VvtVBJ93NMcAnPV4JbQbuTOD40zKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1kWbCnpRZfc4w6YGnaphtvlmF/esZqfJCe/yI6UHUO8NaS2TSth8m4/Z6/eAxFSp0X35C0P//55YpRAMFKJJ94du0/jKNPGJyryzvQGbV4OZANe3rmRqUwgDfOFYb7Rbwt1h1Z97QXCS/OB703A4YT323BJEaoXjVQZGU8yL7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkTKHuXW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bf76F/Ni; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkTKHuXW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bf76F/Ni"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5H47a3656080
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=poC52eCWfGjTRuyFHqnXPZmO
	tWy55VBXZIWXrPhthEQ=; b=KkTKHuXWfu99YB5ufLTwRvjc6+Y6GFSWIW+6zY4d
	pXW9tEU6P0qArWNSdla/Vfpk0TfdA5+5wdZxcWn2kWK5jtowGBaov4Nou4kxoM9j
	kMYIaAwv30HrRpWfolHUDvI/L4wUSHjZuG9WsF3fQoNUXvnpgxZZ2wq2Ps/1hWen
	eqO+XJ9BDW65bccb/i4B9UdQV+mDJ+vXM7IAuOtI8101mE2v9FgNgSkAwHNphnEi
	5wEpbzxbxd8NJfyzi/lPD7+uNLQm8JLMMRrI0cqrY3cFQSWZfQC0UNlxoB83Cpjs
	+hRNdbZbE1qeeHJndX6zuNOVnvmF67dAFEqJuLfnHS9ePQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydtn5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:32:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so979789585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 00:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025544; x=1789630344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=poC52eCWfGjTRuyFHqnXPZmOtWy55VBXZIWXrPhthEQ=;
        b=Bf76F/NiSp8x33eSjaiLCt+IIK+Q+VyD6TtMsR2HH6T9jAWSSycDWM/xbwRGwHop85
         yqcyTx2NRDJh40McpVnE7wC5kPpJW4dim67g637DEhMMZ3cj1sV8e9qTx8n+WgGDQ4kb
         VI/MiB418xO8RvfeZIaM+cOMaAfRkt3mHl6DSf3oiOe19TKOY3QHUdJPiePuyloSIWPs
         BQlmfjiubPj5QNyBo73NXdOiJYnw55ZDye4kj0SDCqKC5u7yQAYjKFeinl+0qx5wamZC
         niKLovHvwPkaHHVy01kbGtV5Av2bQ5v5Ha/JERoZ97GiMdehiFd+E8+L2aOjiSti3Nl6
         yk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025544; x=1789630344;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=poC52eCWfGjTRuyFHqnXPZmOtWy55VBXZIWXrPhthEQ=;
        b=Fz5AKI0iWj3e4yTJ5AldmntZLsp2Sxvnyq2fMiJ7GBZyVUAcT6IWO0t4WlMKl86ATg
         ZPjRH7TPPwoUWLJvY0Mk6vPM+aqvO88xYIuQV/5hgGy7dzIOUGCOtb+J/h3/rDMXUzUs
         15sxfYNH0MTq9WUI9sYqoWU1klhu2GyYhjUoTfgGHztYG2t7tXJ+GYH5OsST11RsMzev
         nVnngFi3Xj0SMDR2GxNk7iTPewDdqBsaR43CmMpBR9ekRU1mG59uhaemch7jaLPv4jv5
         PF31N1/CwzOjzxDzFjdkgCdWtf95BGdzqFUrxvhjagweBh3DKrIc9AMEN54PGWiXhdLS
         dHTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxhow8NH9uKslUvHBMDKObwTlfy+tSlSfwPPrdz2zKEvjjcrrmaJIPOoA6UJG77A9xtr4VMRMitou5Cu8w@vger.kernel.org
X-Gm-Message-State: AFuF++lAzWgad9LG1nkzig2I9wgPAx++G1qklLq7+NIe0MCCPxXc1AZF
	PyvPIq9W/wck1FIReJUI0LKu9Gef+iDogG90qSs4LEdpzQLGtcao7QNz/RsHrehnCXIf5IsRop2
	7dHYO1aa/WN5M+HLWtsDbTWqftHak3Qq4d9DVaOfSuN8VFZ23ZdWHe3tUXy+BhpyKEZOc
X-Gm-Gg: AYBFou0fWjTbmfdcB5BPOZMUT5DQZnRksimihLL9nX4Y833+q3MUD7feNZXRYztCke+
	kZfb0cDDPAeHDPOEXlinsK7mGSdn9AS9d/IOLp96WxIyVYvpSnGb5HaNQ/0w9caoDK2rWbRpoNI
	0XnLbjuEh5YAgZxo3OTYA7udDxslfU9zbvf+ac8Uavj8Ck7uKkoRsrH3V8n/jikQCDXlp3eccdO
	JInX5xzhBUQNIMumdGlkVcJmUSb6S4fhKkIxdwCTrP2NFTjK5XWAV0tJEI56l3M4JqqLESRINBM
	mjjv4lYu6DZ4mYL4W21Z2A/ydb64n1iXRuKBJxZkQMRcWdDrWfk2PtWPkjTfG6TrTSNE8EvbCcb
	pXhQTXhF8L0Js
X-Received: by 2002:a05:620a:3186:b0:939:c9e9:81a3 with SMTP id af79cd13be357-939c9e9e6d3mr1215264385a.30.1789025543724;
        Thu, 10 Sep 2026 00:32:23 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:c9e9:81a3 with SMTP id af79cd13be357-939c9e9e6d3mr1215259585a.30.1789025543213;
        Thu, 10 Sep 2026 00:32:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm249206745e9.4.2026.09.10.00.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:32:21 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:32:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 6/6] interconnect: qcom: msm8976: Configure auxiliary GPU
 QoS port
Message-ID: <lhle6hy3ewf6tahr3ynmvrzlgai55n2rngy25vhqaawj7jsmt4@znu23yqxfn5v>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-6-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-6-6dc5b5e97626@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa25d08 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jW8lGn9s46bW74Nh9CgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 0MffUcCR4v-DCGEqIq3UVrryAryV58pj
X-Proofpoint-ORIG-GUID: 0MffUcCR4v-DCGEqIq3UVrryAryV58pj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX73+Kvo5++P5U
 FsN7YfEnaPntwxUr9Q/qZ7yp8/UhEAW+HVOQRTxgSeT1YcVFVy0bVYNWp7h3Rbi1Qzb3mgIhmg+
 fZ0FYHdVI8CtkKTUJb2U+v1u8YDgXPY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfXzlQMsuiJK84/
 yduwmZJ2mo9RN1AxDLsLJflLDZ2QFtlLWRpCfCaaCAEeMj76XQRnJnRwCxWf+U4HVSwABhflHOq
 v8xZn3Aw+4nB6neB2QFP5eMZ2XSQQqdKkGBjNSnqXN2ssA90HA3k3IAQ2mspGhgsZVhZfzqRI18
 6oGnNfF2cqovxytCYsZvP/l/32kuGfwfO3AGSOfFQs3QUCVmuDSVr5itPEFb4ZvhMtBbDj0+NU+
 7wHPSDsH+wNu5ha+f2T/bd7RJfn6/QLPynXn3/Ii2NAjW2bgyGhXMfX+fvVHRz3vS4J/cU9Fns0
 xs/oiPaqgMxdylKsGdUFPxWqkZTtCbeElvvmBphe+285aeD1ViA2DsEusjQZPfZR9nx2Za6dMxQ
 vQy1U5CqFKZy3Cln/aCU9xsNkW54dKuUuZbaTTETg4h3VuBSdpYxjXfhCsZQW7XVPQYrFc0Jh4c
 NuBmRLlLD3wst7z1nLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100080

On 26-09-09 18:41:59, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Enable the secondary QoS port used by the MSM8976 GPU node.
> 
> Assisted-by: LLM
> Fixes: 6e3ea1f36b10 ("interconnect: qcom: Add MSM8976 interconnect provider driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
