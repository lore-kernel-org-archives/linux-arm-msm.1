Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF494A0154
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 13:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440462; cv=none; b=i5QFkc3w0qji+FoPmcG6Psf+AQg4eHNyYQpMBX65/sYc4cnbqfBdh7LVGgJjWEUdXJoNVEl+Vc/YW2rrDrDp9PQWrQZmvk5osGulPWxivyAE86lGng6uYa+GPcceP6RMPqT4JLRGOAGMagTHgXObKPHEl1xXdqXnY5Orko7E1qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440462; c=relaxed/simple;
	bh=dngGBJhK/9kgo9vJC75xcjb2iG1GFJUHs0W7aqvJjec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXcXcaQf800wikR2kZCZKDQ/ZjE3A1qu+r8+z/+G3p6zF/ADCjwzwhmtH3THK59Ud/BsttThK5gJZpb8crTd2Y6StHVOG/c3IdwzCs6rJH/5EdGgfq4hDMrmYNGytcL6M6Scs+BmMvLimEy9zEOetw2dSMRfC7r35cw4LHAWB84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hq1tFcTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BwddW5Ac; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hq1tFcTK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BwddW5Ac"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHHiX327193
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 13:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7olCBj1l9bJRK2LK0lRET0Ob
	LnDUTxPSDB9xFroQwFg=; b=hq1tFcTKBfXI6zFiBjx9sVfm2ksuP3V83Be1RSC+
	nfwDsHHuWeZ8964uwhzm9U/rfbr+3+smtImgchO2Kya/eafmPRUsuuNyyZaWFVwt
	ejozT7B6RB96tFKLBN8u3U/EgbSQZMwyhgBaoxaq3faqPsT5O25SEOMqnz4tIH/a
	1n2kY0RThDT2y50KgR9b1krOOHmuklBxE+/p7WNoQoc3+R02vsKulDNEHqehavJ4
	T90pJbt6qi91wC3OmWrMccV0mF5MXJZGY3Y2+QKG+9tch8RYwSZGCw/1e82XO5ke
	8rYuJBfyRw9KzOwlczkO1r2OyxzuQv0SHt/6i93SR9DBSQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekhb0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 13:00:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939062ecda9so345790085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 06:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440447; x=1789045247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7olCBj1l9bJRK2LK0lRET0ObLnDUTxPSDB9xFroQwFg=;
        b=BwddW5Acn4SItln+gQxVT/qFT3KlusI6/Nyvbh/i/jlPX6ndcbblHT4yzVyMPpVhOm
         eFYVHhKllCTUXqVLj7dMZNhn3djVKRytGLSFwomyNo8dVFSRY67eV+wUn+4A0v3ap4/9
         vFrw8qTkYDru6P+ok1cztthYhor6f0G45a0kEGas3ntquzzkjFYskfZchvqgPO5K2tAC
         6weAGNBCQwmFXvpSI8JmU+TG08ZFWwZke5vtR67BRt7+FaBIQ3cPfWH8+0ndZ60mjh99
         w8HpD+hsKq8IxSkPpYx1bwihdSkUqTPsDSA7VYeNvxwhcS3rtfAvCik1KioVlxFVVzuo
         uAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440447; x=1789045247;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7olCBj1l9bJRK2LK0lRET0ObLnDUTxPSDB9xFroQwFg=;
        b=nUhrjzBYYnRRGA+fYhPcllrcrMQZgw1sz+Nx/KISLq5PEcwb7E5Ffo6aAA/qLDv7lC
         gnAaYrgX3JD1RF/d8wIF+vWglb143/d9HOZUKbqDRcwfWE4SGqt80HGP9rkLzmR63yqt
         o/mKQeVEyPFZa7LWFUnOSioRuoWaxgThqO1QwQKsL5QisAjzwxzwdAdsyaFsJWi/KuGd
         tOIoRNvcywia3NujO9s3TCUmJbKWyu5AiMX+hWYUuZHdEViYPsgUtC/306TLTu72NOFE
         w4G7ZxbD9deymIL2dd2xaSrnwNV5dcmlDXaViTu7RSH4hyn0ExWd7yMxodIFWRe7gKFr
         eDDg==
X-Forwarded-Encrypted: i=1; AKwUvByL2O1kRnDr5BMeOF0TYK4PJj3bjGHnWeanJjNFkJqKG8w2otvDrEr1MiZeKnzuH/kIgQiugRiF8ixyvs1z@vger.kernel.org
X-Gm-Message-State: AFuF++nkLl+W1k7Jy0lL6Cc6H9ki0rTXn5U5VtsE0vzOfw4ssK9elOLW
	lUDVgIb7mba6K25nAjuBt7XrzmHBq+u/HMMw6bieB0Gw6K+nvuVAavHzJdgghCl8ErTbqFeWj7M
	lAst4WkH7wHxDYSSxuBrXvHvaSmQcrRz/RxcNcXSYbELWlNfgBLXShxVGPYixVbY229vK
X-Gm-Gg: AYBFou0wewYvAsjCVm7KXPr26JEgJDBXukfVMzOVtusBEh6Mby0NOHIoPLHfcuFSQs0
	Djr2Q1mPQXBJBwGVqLjRWVYfGmu6DIsD3nWz9r/6D5XgXtDPppeqH3kLLLS5MJfDZSMQuvCnBv4
	FAN9BtFoMoFur2Rqh8G7lwfxvhKP5jyI4WW9RixKUnxXSYQ+TgV+HGtht4wC/GlB0Zksw4Y46N7
	LWRAg09a5OF3De1nXTJw0gpT7yWbUmE85BFqsDoAOpi2LgetP1lRO8ym+RGOhjHQCFu9SHSutbI
	z6YQyi18AR5DPr34tcV70LrK30PRLs8sb5O+N3fVQCNZse4HPJvKxI+920aA1c6kwKWlRqTW2No
	GVJ5dubLFXN/acg==
X-Received: by 2002:a05:620a:4504:b0:939:6de9:d52c with SMTP id af79cd13be357-9396de9d824mr670054585a.49.1788440446516;
        Thu, 03 Sep 2026 06:00:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4504:b0:939:6de9:d52c with SMTP id af79cd13be357-9396de9d824mr670040785a.49.1788440445779;
        Thu, 03 Sep 2026 06:00:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ee9cf7sm14617219f8f.25.2026.09.03.06.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:00:44 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:00:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>, Alex Elder <elder@riscstar.com>,
        Daniel Thompson <daniel@riscstar.com>, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: qcs6490-rb3gen2: enable TC9563
 embedded GPIO controller
Message-ID: <jtfr4spaxfofaygwyajtc3y4y2pfppxlmsv5bti7qikh7up23m@555urwkjq4mm>
References: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
 <20260903-pci-tc9563-aux-v2-5-34c625b542c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-pci-tc9563-aux-v2-5-34c625b542c1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CPHDgvmLWfvOMohcZ1gWo-2WcbI-trOo
X-Proofpoint-GUID: CPHDgvmLWfvOMohcZ1gWo-2WcbI-trOo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX6w9+XfgI6G13
 MtpBdxAxrWxLroUA1615+yuMVm26iPmzDnSpWemHsogCPz9eLWK/mCtxwHb+eMFvjUGN040rw1R
 rYEcLE3lj5f0Nq28KxB4dxHCaWaVwVkEGeNdQ/wjP4X8KUtYez9pjFHn6ndZMyYYqR9UsC3pYsC
 MrMvPCHqrzLQ82RYmUGHT2ZzN6wcndeHBwz8W25l28y1dDAVhHYMPOMr9BXRkpg1SBjUG534Xip
 YIzA4SaldYrD9xxybcJ2KUJ2jb6EZUYODFnKDErDG+MboTMrUDJqSy6uhiEq4a1n8rEKWYFA9Is
 9oTdYtBDz3SZ8Vx9agdznMu/olKq1HsBCXfeF0L2Ukd5CDW7mM1ihi9W34wX2wt/2xp/qHLaxXb
 wAtMa8nweRWJPBOHVIedDN8+MyddDnr3dhf+G8AcMKM/zRTwvjMVpkaZFuR0ZJY8rzPHY+kdaKy
 xw3nW0fiLkhBI1vTmGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX+mCOdDtJNSBC
 nqDnHFh7GJnivPikVLkMp1WvEPVsK/ar4ANpiXtkobkLl5Xp1LK/HghB+c2KtHwJREMk2JM2R+V
 v8VAbpSbl5IRKrz/TP+hXqC5nMVRxHE=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a996f85 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=fFHDuP4XVuiI0RsLl8oA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 26-09-03 09:53:01, Lorenzo Bianconi wrote:
> The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
> lines.
> The controller is registered as an auxiliary device by the TC9563 power
> controller and accessed through the same i2c device.
> Describe the controller as a "gpio" child node of the switch and use it
> to control the PERST# reset lines of the two external downstream ports
> (pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
> switching to the GPIO descriptor API for per-port resets.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
