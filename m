Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82F05592E8
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 12:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958355; cv=none; b=A9uqk+tyWxLfVLfi5Vs4ze9UgWtsRGih9D2ruKRGMbJbd4gQZnt7NofA1aAgjwGe5NxUsS8/is+M4y3Mj+kGQFxkcGAde+syKaZKD48+vWXH6WjRv25I69SrR1M+Jgmz1pCAFIjBfk0/eENTpXnAr2lsxD0D2SFKPXcx3Jfxn3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958355; c=relaxed/simple;
	bh=cXvKb72H0RorSkYji2BUaKKOmRWzyLka5DqCZ/QXA5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NILORjf1al3yLeHPpV7itnOO2MjBaTT8tWU+3AIRsQer9d2nx3D2WvAGuhpl+axa1oYIxz3bQF0D2VG/pIlFE8uRoSCJ7lfsCzOKSmssyBrXKFMyGL5UCR5L9Clcyx7qByzz/Wxp1+5IH2iei7n2EWGSMDjS/76XU6kIEBw9Lac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTmkYS9R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCEhywbP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTmkYS9R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCEhywbP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BoXKs2698601
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 12:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w73lEZrZCbtXfUA5AKv61bGeGDgAyCOfith5TyGHEmw=; b=BTmkYS9RPRLzZtgg
	ydHh+ZUEKk15dXcGuRmGDIihvg+taWZBQvfLY+5f7DckGqs1bGfAIC79VUAxI2k3
	byuF2VDQWyiQRrk90F9SoXxf4oehlVnNkTZFj6l2L045As7ghMagDyYWQMUWlp4G
	NxVONX7F6B0aLi+v+rlzgKoO4zAJgokh+C1BNd9uMSVl269ACmk5f20a2XwjQ2Rp
	KYExKvu8bKvrUDELdWewxi/nvMa3nMH1smsYZXu7ltenxCvX2FrEmc/aid7/W5zu
	hgYwe8cEUKa9pqzRlI77lBLFrQa/4MI23w3ADSQ0YMUcRsworkxNUpxCAP4En4au
	lT5KKw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh06um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 12:52:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so108560741cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 05:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788958349; x=1789563149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w73lEZrZCbtXfUA5AKv61bGeGDgAyCOfith5TyGHEmw=;
        b=kCEhywbPrGoVj/HMoKOXauZv/9wy8B0dZHx12vW9LYa7J0KSiLBxCizNN76HBh7Hwu
         ET6yB5pD04Iic301RX4HV2BmaqFJQZ+97HilIydTpIeICl5lq8arWuQcCkiYCOH5qNsz
         3V+puWcvK2lIZfM/CiEb01ZRqGw/HeNVPp6FSyODdVYlrIf2XaZY+7RkMegXc6RTINcw
         FJlYWjbAz9CbVjgIOhG8nUAoO7Kb1KtWkgzJXKU7gK0cHEHfSomfQ98OWvdL+UhIyjAV
         Lb/ld+HbuEnnVZBKPFzXmh6WlOerP71sebq+YX/r7Jpu9IGhqwj/xXPwo6kYlmnBNWqb
         AKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958349; x=1789563149;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w73lEZrZCbtXfUA5AKv61bGeGDgAyCOfith5TyGHEmw=;
        b=NXt/70c1Y998CR5B5XY6oOpdXlkA6/Kng4Y2CRNT1BgCL90aSbk36SCwvSUfF9n1AB
         uXfj/SsX3j9SAqvsKdGOrGsd3lledRjWeWljaAlXyFp5ZMpf8IFlE6E0nNiD6rlSKe2s
         rIM+9ZWw7T1qU7v7g7OSmqM9gqCLCVvxQXpDXrMDa6n7kNlqKrInanRUpAWYdvFAvQja
         1BCPGS+0Iz5u2YWeTlHN9XEs8IatPHUDdN3dOC4o4zW4g9ad68izPAL4vybpoWKmw/LL
         BfgJ3OQ/t6y86AnJ0hmxgPf3XVHS5j4cor4PSsIbcvXuDSCXLEXmXN4w7Z2tJ3oRsdQ4
         UBdg==
X-Forwarded-Encrypted: i=1; AKwUvBzffiQhHIO7rifTXPIHDhrwn45fLwbRCX/QLHdKFykjbI7WoCHX6PsYhOEw6Y1TAwcUHXKZ38AdPsguiajX@vger.kernel.org
X-Gm-Message-State: AFuF++kcH5GUbf6btn/GasXgyCv7KVrqJimTHVvUy6on3SUHoiy6B9Py
	KttPmEZpIkgQdtar+6Kas7wwxzILe/d+zuNQVsm9hbIKIgdYtSn038SnYQFwh+phz/iMu6XP4gi
	UmyRMTaNrVbWTeAkzmD9r1wxuWaMEv2Nyq83SnNrGWNIK2lTth43YJ6lDI6d276bbcYRH
X-Gm-Gg: AYBFou2bkdJy+gvIfTszt84t7t9x/rCBvkN2doaqsBXYu7f82rwuh2uQhE30PvPiN0m
	zlHe2yEMMfz81B0tulFe2NK6HJeOytc5sx2PODTv0ezxTisObT5KdMh6VbKofEVJRlJgPZwjnJa
	/l1y9S82DyCuSvv4ue05erMEm40iOoBAbSjIMCmg6xj2QV+S87FAh/61TKmcJndI9R+sXzQ+OEp
	xX/tKJdauHQTyiu4bvJGdkFGshD9jnruu7l5Z5hu4MfxPzGq5f9SgFWZNfCdBhE3gcuNBIUxg+L
	yzIrcv+NaMLinnW4DioRT+EPpb/1WLG1OYNIY/srgo+v516YN228ackr12NcotAStCNh4Relr1B
	c0wNzr/kqXrzeFPYzbrguLWgC1sc=
X-Received: by 2002:a05:620a:28d0:b0:939:72cb:bae6 with SMTP id af79cd13be357-93972cbbcc3mr1268674685a.29.1788958349630;
        Wed, 09 Sep 2026 05:52:29 -0700 (PDT)
X-Received: by 2002:a05:620a:28d0:b0:939:72cb:bae6 with SMTP id af79cd13be357-93972cbbcc3mr1268627385a.29.1788958344263;
        Wed, 09 Sep 2026 05:52:24 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:de8b:7fd5:2738:cc2a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa0b9sm768027666b.11.2026.09.09.05.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:52:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] Add pinctrl support for MSM8952
Date: Wed,  9 Sep 2026 14:52:20 +0200
Message-ID: <178895833828.30492.93870770541896598.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907-msm8952-pinctrl-v5-0-9a2d8d72ffdb@mainlining.org>
References: <20260907-msm8952-pinctrl-v5-0-9a2d8d72ffdb@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NCBTYWx0ZWRfX7kzNv57rReD0
 tVbajsgWB/kyXTI4rg/rphMivihkgiBkwp1Yn1sdBpWYlAWNZ7ViJWwy5ZwEk8HhQoi5aKGByLU
 DBChkrxnd5BNP6F2B7sz5O2/VTL27AqUoQ2fbIx31KM+QHah6j7SW8h3510ONvufDWF8pkPZfq0
 HGEodb2f/TMM3kfkyPj/jR7/J7wIE3W9PGSq4iDvWv8qrzrwcfwhn2ur4DELs+2K9323Df/NLXs
 X7gwD7XWGiyI4EdBXg2KrhWYUl6l9QQ1OVsLIh2joTlQSc589iatLQ6cDSae0okd2GRNFDQTiD9
 MWcIJiSCIHu2SlKlda9EqOXAjHdH02ywroXvJcyW/0uRYuGereHXIOfgEBvAhyQTOZXFGETVAZ9
 gUoNrsN39ZZ8GIpIkcB5UpwK0As6H9GrGPCP2przH2FqXr/V9cQYVHkwqch+LMTGtzDT+8gEmS+
 QbCNriVDl9wOQtg6LfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NCBTYWx0ZWRfX3fzPeu4EpUXZ
 khlK4YRsf5Vt3kGo+YlQsuH49Dhj5/yX8YDQegPKl56uojU8bBhBPDwhy8ZVnRNSn0h/qc9I3cn
 GKONiGA2zJTag89PQ11fD0kAIBrXwBU=
X-Proofpoint-GUID: Y_dwzUsJmfOTnQ7gj1CVGVjdazMk4skx
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa1568e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mPusQoNMmh5jHkL4POYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Y_dwzUsJmfOTnQ7gj1CVGVjdazMk4skx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090144


On Mon, 07 Sep 2026 19:05:23 +0300, Muzaffer Kadir wrote:
> MSM8952 has pinctrl system that is similar to MSM8917 pinctrl, but it
> has some differences in some of the pins and their functions.
> This driver tested on General Mobile GM 5 Plus.
> 
> 

Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom: Add MSM8952 pinctrl
      https://git.kernel.org/brgl/c/2f006f5c617a56afe7683b607727349e0aea7814
[2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
      https://git.kernel.org/brgl/c/b53a6210af0fe559670e298349968beae2c7448b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
