Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730345;
	b=c2lkLI/5guQMjJRTfHnDGcMCf7Uekxt5ASgnF9As7cg7rfco+LiaJNZIlwBE11SqKMhp
	 kPkAVP0WazC2Iw5ZBy/tKqeNPA0IS7EVFjK5vnRgXOF6Qgnul4sFvSnnVY80Su+gePLvG
	 5m+n0RN9Y6J4+YNqRyvNVsLJtQirtMzpAjt0luZmyL6haJVmrQQtfOOtGXFycWp8pqMLO
	 aQ0MzhS7y4a8Vsk4hlrvMNxSQQBBII5E8g2nC750wxqxfo3Q497aCGzRtaEHVJpq2K57s
	 oYQKRZd1JPis9fXUz7v6Y9VQVJEocyqrxufEEZkLnq740pdQPLhPrAKBuUWsqzJ3bag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730345;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FT/29DxCek+u6Iir12gVG+QBE1yDedGq0SaZlDcahPI=;
	b=2gTgOrK5aOhatEZfT2kL4/0LAdmAewZDUqWV+BibqqKBMYNB9LBzd+STo3mOagLHM8ch
	 2Ps7VLo4MNTSeg3u/E1dQJi/h+ETqJynXlS25Jy4VEyrNsM66VnQ8nY7l6t9hdK0TVe4k
	 nkvFLDkBJiPFEdEHVOr69U5KAvablto66nRC4vYdyO7PgwG4407w0moRXS4+k/1BCjRhT
	 KCljxZVdMI1T/UGtTT/O/aVFs+Jj4tZRBUqWgoXxsy+WT9uJL90OyAeAwaoPY7Nmol/nx
	 +aU2MJmXswX5CcYXG7/Mogz20zOXyGelakjPstnQv9qu5eqli3hwqWarGfnjYBWTZSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WBNpcd46;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YdU+kBZq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A68606D80D
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 18:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77A68606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WBNpcd46;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YdU+kBZq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3HPFRY4091669
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 18:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FT/29DxCek+u6Iir12gVG+QBE1yDedGq0SaZlDcahPI=; b=WBNpcd46dTWj1jQI
	ue4Od341ZIwYNIcE5jT5ZW1L+CK7vBaVe37HmFbqbmPiU5rzfrsCLRtSvL+oYa9j
	D2x8RJFZ1IHrTE2cK/l/Zf2TDw6O+J9Pu6CktyfPFBppLmcFX+VYiK3O/J5rqhPZ
	DdZr4ZBCOSL1ERM6Ati1iuOT0ZBg/K+hf5MoYKun5NiED65othJk1cOzN2YmteL+
	6yLHRZt+LWgQThiqi5nXk3aYFKykue5wfCJGmOIeNA+TUeIlqDCtug/SW1GG0lWN
	kQiNt0jqayGfMtx3aSXr4Mo3PoPh3mecdV+5dWxAkjLSppr+RxL2ABNvqlOv9nV1
	neHakQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgp8g5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 18:25:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a223755e4so17251568eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 10:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793730342; x=1794335142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FT/29DxCek+u6Iir12gVG+QBE1yDedGq0SaZlDcahPI=;
        b=YdU+kBZqMFs8laiF9aAtGTlYQDaGmuzmWoW6uwXzIFr+G4qLiBfrIHM83UJOHnNo5f
         a5LNeRBabM0vGc33To7x8tKYKKqqr3u8DtFWUor44TK1ByKYupTJHAM026idZt6O3WOq
         dBCcDMgm45nK23/hKKrxAC83IvkNLSV6w0vMVkTz/x2BIftB8yFhNVkCgvueACQGJQib
         d/fGOxXhx0YD6so16K9cMl98QpEl9uGhfZKwfX5Zq8hpvwz9+VPvfaL2F7j17IIbsfQ0
         7qmvQB6BSs1fK/R83Wz7lqF65PemHXY5CSWmRYmc4I9bAxOnRgWLpFNYiHny+f1XDbBL
         eedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730342; x=1794335142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FT/29DxCek+u6Iir12gVG+QBE1yDedGq0SaZlDcahPI=;
        b=HUKZTi3ZPMzDjmfEPugm9Tu3OgBloEHY4fxtYm085rYm8oPqQhE7yHmmEWiQdjqhUE
         WtNgPrPX4Al8yjutce/xfVsKcE7GR4xAgoKjFKKerMJccIppThJFRbR31VrHIzzfoKzS
         blhj+zureP/uV47geZcvf/EEPipvBhf+q52EtkiEm+E3/ia0XuvNL+5tGDA/LnmWE0nO
         NA+e89nkMfmRczeTqC2X8U65VEPv/jKxYTCUNZ1zEk16IrbrYpkNTU5Rk4QkecMHBWp2
         lM5ya7QzTJQ0BgEl2/8MFlNFiKR1anJbFFTNYAmuYLNvZXaz5UnClvl1SRHU7pW1CHwo
         pIlQ==
X-Gm-Message-State: APuU4Z//cbpt2VZZMZnf0oyDHZyjwfV/07B6xcdHE85FZ3UBLpTuf2Wt
	+V31TYg8VlxEkTikkOPjNAwKF61bby5hCI+mxAg/Yex+i0VQ3//py5rhmplKWXK1achkP22V0oX
	av+5wtBBZh8n/Vtz5PUGuNAs3JyGlfF/sBZIYuVYN8L1WSIT+PrvNYihpORjeUkflusramPzvM7
	RC
X-Gm-Gg: AYBFou2JWQsL+kQUikyU2mC4Q7fBzKzdhEHk8oUldxn9RMhJgNph26/snbdfNz0t1GJ
	MU8zaX8xgKoFVD36/plYyyZXzScpXAXRfNsZOSG1uNjqbKwNcZxGflkYKz8uVJE5alEZVdNxAqT
	164KZ8WT6tjC09MmOH5VWkbkg0wXzn/BlK6X7mgwn+n3C7WfwC+QVFffj51NCrN9kZc4feV21+q
	6F9hSqdNWezmDPmqXstQJx66rVbXZ53xYyn521HmFAhg8F8QDxA85IIQO+5PpSLSDKScXtBH+BU
	41qDFwOJlB81tlMkTw5AnAbXTRdY/SCieORJcX/9f0JBQfHGfZtm8rzCRS+kFIlaRc1MLv/HaR0
	W8DKiu6FGgMtX64zTHT0R5D80ZMTv3s6bZKThFTXmFazG6gcam5qf34LGcBqFuDLbhPADz80VJz
	7k
X-Received: by 2002:a05:693c:41c2:20b0:36a:5042:85b1 with SMTP id 5a478bee46e88-36a50428d57mr19146169eec.2.1793730342321;
        Tue, 03 Nov 2026 10:25:42 -0800 (PST)
X-Received: by 2002:a05:693c:41c2:20b0:36a:5042:85b1 with SMTP id 5a478bee46e88-36a50428d57mr19146127eec.2.1793730341766;
        Tue, 03 Nov 2026 10:25:41 -0800 (PST)
Received: from [192.168.1.10] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm51979568eec.7.2026.11.03.10.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 10:25:41 -0800 (PST)
Message-ID: <a30d7d12-9cbf-4920-b4dd-d9791149b6c9@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 23:55:34 +0530
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
Subject: Re: [PATCH v2 0/6] Add CCI and CAMSS support for Glymur
To: Christian Cortner <ccortner@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
 <179346368177.44447.12360580299773199469.x2e-share-camss-dt@gmail.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <179346368177.44447.12360580299773199469.x2e-share-camss-dt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3MyBTYWx0ZWRfX0J4k05Geb5TG
 ageX0cV4kllHhDJ6F63aYOyDueX+Vy8hP8kYPHcpr+AsMhZ/BwKFeeyCno7NiVB/isUCjHPp/ps
 sQKe7pBurG38fnzmZPxgNcs5XryW282H5N7itPncsavpQiuxkJtQCY7048GBYnnH4m6TL9L1FHR
 /LUT7FyWP1DkGELdqJeGz1jTx0s8zT30LOc18Nt2+9ObSVOHvfitURQAjHFFtF7KnBesgZ1NRGW
 MQlfTOf4rYzDYPx1mezaj5eEMKdzUdPSjpdntf3HRdHRVVewKEtXzkKKKuPzkpro+hJYF+EPy/n
 5uEOPx12dpe963qQUFxnP+2S4O4M0R3dXaZwtzjbKSVY/pouWkuHX6ZxC2lbYq2DQc8Fal5dMoK
 onDGze7BlqV/iF2LutB1CPLyFHdJ1V0nOC3ykPn8H4/4CckbhNbS4SViNOPOAKIYIJPW7XLLyei
 Md6LhUFbYvJXrAFg//g==
X-Proofpoint-GUID: WPy12Qzm8IueKd_AkdOAvPvM4td2frnE
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aea2727 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=4afNKWI_y86-DhA6_rsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3MyBTYWx0ZWRfXxk8iMWS0kB6X
 pGoZ6XClcOSy8LuS6Mj8YNyo9St0sCEfVdFKnIVZF/mzA9xHVWmOi77C+O0zmf0RzUWa2Y5u9ng
 1PJx3Q1y9yVdqtMtnYfsJdApenTZfxA=
X-Proofpoint-ORIG-GUID: WPy12Qzm8IueKd_AkdOAvPvM4td2frnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030073



On 31-10-2026 21:54, Christian Cortner wrote:
> For 1-3:
> 
> Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)
> 
> With the PM8010 I2C series v3 and an ov02c10 on CCI1 bus 1 and
> CSIPHY4 (2 lanes), the front camera streams 1280x720 at 30 fps
> through libcamera. The A16 node is the CRD wiring with ov02c10;
> happy to share it.

Hi Christian,

Thanks a lot for testing this.

It would be great if you could share the A16 camera node patch. I can
either include it in my series, or you can post it separately as a
follow-up patch depending on this series, whichever you prefer.
-- 
Regards,
Nihal Kumar Gupta

