Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269471;
	b=4R6gYnOcLDlABaefM85FhxZ+ZYuqXD6n/IZCSdTJY0dwKbOQrekdLK/2eMPunS1lv7bU
	 e06CSiAplwlBl7pyCFXKJjobdy3+0ox2n4wag42VMXQnH7qk9IPU+DZ+Z7WvKumKZ1VMw
	 0ab91Ek1Q17Z0h9q5g9o+jakDSK0f/t2HPITEOa6pviovPdIzFy6861nMvKSNybgAWCAm
	 iZ8Pk5eWJZoqOLiOQWer583dWLhr39DmErbwIMJE4dtflSNoEj/ECf3TbPiPkCZQrzNbX
	 EC/QpK81V22iXzBp7cIH7+28J2ZOe/pMHu4XseqfZXkgXEQ63uCJ9yZkGQ3UbpUuRFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GcPKgaoCuNaXXKfK7YHbVbvTQ8K5JkvfLVdxqmyckTc=;
	b=5eFO5xpuxRc/BDJEtdd133wDvhhxhiSj8kJ1LVSvyB1RtNFH75DIuGaaw4LkszmoO3oP
	 1UsSRoPgm8o7UMteYVbPf+VyCmfC01j2WO9wYpc8Ls3Wj3pzWdzPccf7AtJ6HcZCnzgxU
	 n948aCtFSqfUWOjTbKiwmN0uHUQi17E44aX5UKbY76jfHk4ah1oxuxCDA0qAmehv+RPMp
	 1XRlv8nbtE5mdB4Md4uFikufBTzvwiTwfnt84YgHk853bb3cRjvOoAQhlgWMFR7MK5mUF
	 V9DRGM0dpbZSB6VaKEQBovrQbLPNU4IBSvs7N7XTcRH/zGaHK2cU845DzG/4dS0mAqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OhntgV04;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fFTZJg6g;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED289606A33D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED289606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OhntgV04;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fFTZJg6g
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vAiu2725110
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GcPKgaoCuNaXXKfK7YHbVbvT
	Q8K5JkvfLVdxqmyckTc=; b=OhntgV04JxTQ40rWyj5d2xZa7/6KHd5OJ6xHoU6H
	q3j5Z9X+YprB6mNk4SZ67s0eBct7rQJBF1geRSaXc/73dkP9z+SzEy6t8KOAhuH1
	r79VMzerhOJ/uJw4sI9xav+XuYdzAZi5NiwPch5lm8aDee8ghX90uYGxrgR8Ozy5
	1hjOMjEgP5deK2FIFH8OQjNOxvl5LlvrvKoO7z4IllkQ6bgQ/VIMKMdUrd11hPbo
	orkQuQs/1phdJYmIuW5GC19SUfQYaWZTb3jjfsUtXQyEwync+LIXT69OORa6UYX9
	mbn4kDS39NMOY//FSnO/4359DWFRkBnk2E9RmInl7JgSNQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hky5s97w8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:24:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb6391e89so369327185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793269469; x=1793874269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcPKgaoCuNaXXKfK7YHbVbvTQ8K5JkvfLVdxqmyckTc=;
        b=fFTZJg6ga2GolbRvVDAuBD2jVBZK1wPFgk3JnbYjG9FUbzxtnIolUNLqDH7uTokc11
         Xvx8MoS3XyNmJZoP315S31fDQy3P/flmXbABWf8HOYJpKrexFUd98D/8w4rJ0O5wAFgi
         2q9siXuBzU0CVnXwTW4CwQZGg2Yud0dAET8cU0li9ucDAbSH8c0eP+oRWXEBprWfdEho
         W2lZXXskfGEmLYYBaHP+S6WdWDCCo644X5iBdB2TKv2kkz/fkXUbmsOhq91v2hkKvX0z
         JAt2XMrLASHQBzE4lzH/CltW2dGx/HfeyyxpN5wzn+hybZIVkiwbn95q12IFsy8q7Cvo
         IuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269469; x=1793874269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcPKgaoCuNaXXKfK7YHbVbvTQ8K5JkvfLVdxqmyckTc=;
        b=UaoM1y+6mTfKBJ028PV7aMzuarYybDT/ghHC1+JwOwRHUT6ye+ltN/JXBTT4X1/kQN
         jYuXyzIfNrmbMTzoqVQ+c/eEQABZymLT0FdAPiqECZE0SH2r2fnpg9gV6RjkYzZIrSCu
         o6gyHYgZASxOsG8KIWmn/XTtn5k20kTlED3BGBDUH4lNdcooGuZbktVTOt6eWTSfKY1F
         e6n/V40fpe7i5r76E23pjau5UmDW+yWBdeU3NAuY/7bexw5hTBx+VAZKqRj2gU5DfFlL
         zRyhQEqVY6cV1ujLJjtN2vyCHxYhOEbyeADCeQ1Iv1Fy+Z/sum30NyiSK7qg6kBbxwH9
         3/rQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0dC8Y8QW2+LftnuAgVlCTAQzpuGkqskP4/wLKuaBX0Nafh1QPreFsf9tM+3Two/zpjAj6cpyHtP+YwnsN@vger.kernel.org
X-Gm-Message-State: AFq9FYKCXTZXlrG/iHQ1Uojb2t4aoTZnhjDKQK7sFCQLR7dUeQt065Je
	dkrcGTRyqzzGR/B+eforE7Xv3A4xC8kCoRnvDaJ2pI/aTx/jQKW3EJtLKu0gA157fKFxbRrbKkT
	2DDwQIc4b/AxMgW5kRhrBVVp7dYtgIZqcT1Y+XOePWM/0D9PjtTrpuUD+j8MnpLi26z4R
X-Gm-Gg: AYBFou0MM18h5yNpU9BIpsZLyQqdK73mHmRL9Wd3cFe2NdZ4VNXwgQz18hZ2zW994Xj
	TnU8OiqGJUW3C+ENZ7J8BJWP81IuN2xUIaqVDHjxIx1amsV2DoDzKjRF46E8prbhJvpQgixvxim
	IRm86u4NgtIy5sFD2ZyMPEmmEh+3fvAVKkgkhr//KdhlicM9hKyEFoXwotu2j3SC/3mJkHS8S1c
	l/lNb63otVjBInJBxHVejqVGjopvh+QZSZfdLCxJmgC5r+rQorED7dCUgjVAo7nV5SCCjRKjQi6
	sA8FMBGUwTZbZgEkD+I+NGc376skmrWCEi7I7tkZNdZBKuxFBxs+hfJhRLkS2F8WJXm8Bg0PxxX
	l6U8layvXxTy899gWM6pMtKMwGsgs0Qg7ElY/l68NXW6V3g2mQ6l993qUo7mOw6Xy
X-Received: by 2002:a05:620a:400e:b0:942:a42a:78a2 with SMTP id af79cd13be357-94408a8cae4mr713123285a.31.1793269469010;
        Thu, 29 Oct 2026 03:24:29 -0700 (PDT)
X-Received: by 2002:a05:620a:400e:b0:942:a42a:78a2 with SMTP id af79cd13be357-94408a8cae4mr713118085a.31.1793269468363;
        Thu, 29 Oct 2026 03:24:28 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm33998692f8f.38.2026.10.29.03.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:24:27 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:24:25 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
Subject: Re: [PATCH v27 10/10] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
Message-ID: <25q4hk2nu5nd4udoof4tsslyktdned4bygrgyzuknhvvvh2stt@a67p3qh6ddch>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-10-fa4b3ff1359b@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-10-fa4b3ff1359b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfXx4OI/1FnKHeL
 IhTGB6wviNor7V7T3a61vmzDqogIZ3ac9Wd/Uy79+4VOq/uL8ypNnDq/4oJoRk9SLIB61wEsoO2
 O6oJ8tYVaYcT0txyMepB7tqe1UzW4djU0XCNUD9nokriY9EhnugRXjP8vzodNSAksOkdxL8RxGl
 ZfkXz4B2QK6TWwWlaGNBrYRPhDDocQJH+AN5GJulBJZjhzWeeQO745cd3zIZeWBYHjakCBYYxbP
 +W439IJ2qSpJYlrKa6JDAzJFPhdYsPPLdIgSKVnzsI3BsgCx5nIQ4janOItyuDm692CoGl5lyFI
 MH88aTdnR6x01gHNwdWTdhmmdlGhd9J/b4D8gm+d14eov7aAf775snoqplsFo/PLjOAHqe2nIkw
 7fuV3JUBAFGrJ247cGLB+v3LpBVEdP42Z+8oxy4VMHpyyptRiiL+3HjltCALxhfZVQDpqAsd/SK
 D1DKgYSRcXaWA1H11qg==
X-Proofpoint-ORIG-GUID: eYYLQR2ElnXOrDY96MPqJcfC8Qhac25l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MCBTYWx0ZWRfXxy/qR4GwUsZ7
 /ipebFu7076wxk6WhQfm08JeBCSfnk6FmakNs8S5xZsKFII7X/UgngYd8dG++8eaLB4EArC9ptD
 JrxTWnfaN+b22dxwCqLvg4XKT7+Ygek=
X-Proofpoint-GUID: eYYLQR2ElnXOrDY96MPqJcfC8Qhac25l
X-Authority-Analysis: v=2.4 cv=f/vdl+yM c=1 sm=1 tr=0 ts=6ae31edd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=1QY0aOnFgCSDOgRkrtMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290040

On 26-10-29 14:31:04, Shivendra Pratap wrote:
> Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
> psci-reboot-mode driver.
> 
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via the
>   Firehose protocol.
> 
>   Support for these modes is firmware dependent.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
