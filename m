Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A41412294
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466962; cv=none; b=GZ4bCRxj4U+m7uBrW0pQKM4GgHh20ZBiYOejYxxhT4Sz11BP903AmWrgVWTrdLysmuSGKfRpeTnsWy4sTJmCRk6/cWWDbmWALE/wpn4xb92I8uBekRL2IT6GImFjx1dnnZCl66StN4SJyRWtpndMWStAF8xjItZAhCrVOlhLw5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466962; c=relaxed/simple;
	bh=tGjDR+zQ31FCowO41vWdnhNF+/J+6BC2DcHVzDdm5hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jh15u3ZnW4TIfw4DPDgXZwgcJ0rH0Ql1qvtlH4Xy36SMdCoeOHL7k4708dqLaa67Mj7h23ZvNCo97j2BMSRiJtfr7mw6puT6nBGipdgpeNUnzJBWBTmRZ4u6YD7A2OLEQdsmgahppgZ/vkygA31qUa5nHbpIjHuFeQ1onjHe+oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WnfUtOHm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J0g32guQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WnfUtOHm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J0g32guQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9gxQm3415569
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XP1SokuVGoe4TY0wnvrhUdss
	t0yinEpiUMhs1jxHPZU=; b=WnfUtOHmqAy8wvNelI2I+7RRETqhJ4IEwDHerEK9
	jQry2pjkPo51DNxf7UEeYhZW7QmQTJv03Ucc0Qdw1svq8nQMJWKxNmHFDJqYF3Lb
	p0FsyiCCC/w8c45OCafw2Er4b6tAUnakoSqhGlsPQKgrkx43u7QM2fCQtDKVp+ER
	SPZkNsZPoUvBSbiEGA6kQHiBFhAsdp/H774l00UtFmN9fgYfdMZt2FSTSXS2TeIi
	94D5iNcWMTM1vkWjlaVW1w+MlyDxdz3pQ0mlZ9KAgS8jSCuUeKnIR/qoxGThBfxr
	xi1eJbq+hI0T1ONJ5PlvJOPjzx+/Gxe7Tx5N6KIxTiT82g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc05mp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:09:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f3426a7cso762990085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 03:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466958; x=1790071758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XP1SokuVGoe4TY0wnvrhUdsst0yinEpiUMhs1jxHPZU=;
        b=J0g32guQ/XbdLrtyeSIc++CKjp1ot4vONDXlphk5Y06Ul0wePgwwcWEWheVduazumN
         vPvhR7p+OBQJBR02bPDNdoAswozGkV8zPHj+s61Vwqvp3CdUHLtdm033xXlq9DIuOGj2
         jquab8VahcVgxhvz7ovvvzJEe0oda3jbfABhUTj+gmAi+IHsHnZtAWfp8V1GlvRe6j40
         rJjK2VjpCa3uhe+xH6/HH8qrCSGQlphtXY1ojxcniBLvtY1R8GHMgH2GbezYSDw8bsOl
         8HvMkKYYN6tbLBdvUuKhJv9i0kYQYNNmlcvjHBS2r15Ldtn2jix03Rc1uUFKkOdre+2u
         I0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466958; x=1790071758;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XP1SokuVGoe4TY0wnvrhUdsst0yinEpiUMhs1jxHPZU=;
        b=FCIkzjPO3MD845AKNQq6PH4Avd/9RZyA7I3PYQ4BmdhadiR2GJL98FVG0fbfURurei
         5zeZJRHRYCdu+KVweupgLyOysbdGloPkrI8DkmebDgXCKBaSGlPJ1/TfQfXbv6EFMzHb
         N9eq8VI/G1xyPuzRAxRy+DcFYP6bLEGrM1e4Tz3uYRvrhXnCnwdPqHmq+HRgRsbjomrn
         og1hBVjAhv+i3yJRE6GNZ9QMtdDpH4JohOE+FDSbjxh0xq92B8OxyyqkQRG11Fs72Y8f
         d+P7wqzluLXj2EXQj0H8r3zrUWK6i0xvfco8bQFl8sj5DrT4LWWFSfZV/rfb81YcQr3w
         PxSw==
X-Forwarded-Encrypted: i=1; AKwUvBxENeDHDw56BxqOdghzuqT2ikG4cS8WRLsJB644VdxzfmKiSkGeHy2uV6YFFLtWew5iVm/n7mPMbQzkIwxL@vger.kernel.org
X-Gm-Message-State: AFuF++mT8EBG+CxHoJ9dboUn3iWHMIJ1KgA8aXjGujbDM7MOvWWUtNnS
	2toZdf99EwvXFHqYoXslSJBqPNSFG/7i76whOGLKglDlCfN/ePBLcu3FEjEpaE2gTHc1Xhoy4Gn
	WRMZIXMJlV9Ed6mzpkgbzjyzT9ZyVd2U8NeCFy2DgDQ35eDdpEdWAFKk6//LxwCdE5VR7IuxeRB
	H+
X-Gm-Gg: AYBFou2gjrXbzYic83haNC/wlOJgYjUeqDxkL7C1f0eW2/8Pb/xl3Dqi9OdYuVikHTp
	lsKlKHJt7XYN5YNCf+woccezaVfy3YQrOsgyi2EUinOU9lsGUWCXKs0Y4NgExs++o9/+a8N3UU6
	B4TucrgRzmC2qhUIaKfze+ULGxv1Jwrf7pqMe4/I0E4JUMUEvq+T1TUdX2185YVU1el91TRx7/Q
	eeGSQBJifLgtBA26et/6rIbIpoNXgxo2tp6zrREw/riIctScIx5HEapj+vodRibY+ycODB/dqw7
	Xo62BeduBIU18Pdq3yscKwrcJFbc7SLG09x+hFluwzCXWtWDS9wG8eUtvQd7wetCa42ZCh8meI6
	L3X9CoiRODiV7Qw==
X-Received: by 2002:a05:620a:468c:b0:939:a199:45b4 with SMTP id af79cd13be357-93a29a77442mr901515585a.39.1789466953402;
        Tue, 15 Sep 2026 03:09:13 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:939:a199:45b4 with SMTP id af79cd13be357-93a29a77442mr901506585a.39.1789466952493;
        Tue, 15 Sep 2026 03:09:12 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef7ecfesm54019035e9.9.2026.09.15.03.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:09:11 -0700 (PDT)
Date: Tue, 15 Sep 2026 13:09:09 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: avalon.vargas.centeno@est.una.ac.cr
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Val Packett <val@packett.cool>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: Fix touchscreen address on Dell
 Inspiron 7441
Message-ID: <ymoielzmm2bdw7wxwpjncdlnuuuxvyv6z4t47dhfsmmn2xi6qu@55hzft2ep6c6>
References: <20260914-dell7441-touchscreen-v2-1-7f7224c0cce5@est.una.ac.cr>
 <20260914-dell7441-touchscreen-v3-1-062d6b93d1ea@est.una.ac.cr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-dell7441-touchscreen-v3-1-062d6b93d1ea@est.una.ac.cr>
X-Proofpoint-ORIG-GUID: RvMCTP7p9Dch06BLutYuPEGnCbu-KfIA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX0RntGbjBZtjm
 tZcbkdDDCoFxR9XpSLL8hWu4lZDfEJd0xzvmsbUvqJd6LfwBAXJOXE3Vc0igm32DjAaNqaUs597
 oofhIUTgAucPb5sZj5XZ8fXtWoY1kRg=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa9194f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=MW_FOeIp24l2TjhtH0UA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX0NGdIDlg/DW3
 x0t1+5ngHvM7cMCqGy7/xefo+QB7Xd+vKdU32Ut0PylahhBNPTxgeB5tOt2qsrnjZO9mdsPZbji
 XinjDz5DexMNmiRwN3YIZ/5aSgQu2P6UoNZRfrsWbZJkPi31rxUWRWd0pVODDtwclF7IHhmG7R6
 wNvKyiqN4XEC2zA4Cd310sOFqLQMDD70KAAvKFpdoeUyqEYwROECsBtETEeTv4yn6jY3755O2be
 EyFnYVLH7eCEgHQ2p52T5toI76xG4ZrcY1h+Utj2y0gMXwlpB8Bq5+INUMG7m+i4X846ycn/XTZ
 XF6Ycd+Qz0pXvRT0hFtO0ViWU63HS42c9pMYo1OT2it/0O59lsUawpr7fVt8tG/Q8M5zbAA0KeG
 Pg23YUbJNB/vifwnEyTcDo/WCdGvV0z7IlihxTms7tYL3vqz/yWt1I7V9+5kY3jDFfe4IflNe3c
 ap4EGz9//6ufQ8OGAdA==
X-Proofpoint-GUID: RvMCTP7p9Dch06BLutYuPEGnCbu-KfIA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150146

On 26-09-14 16:04:23, Avalon Vargas via B4 Relay wrote:
> From: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
> 
> The LXST2021 touchscreen on the tested Dell Inspiron 14 Plus 7441
> responds at I2C address 0x09, while the device tree specifies 0x10.
> Probing the latter fails with -ENXIO and no touchscreen input device
> is registered.
> 
> Use address 0x09, matching the LXST2021 configuration on the related
> Dell Latitude 7455. With this address, the controller identifies as
> 29BD:1103 and binds to hid-multitouch.
> 
> Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
> Signed-off-by: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>

Please stop sending new versions as replies to the older ones.
It becomes hard to follow when looking at the thread.
