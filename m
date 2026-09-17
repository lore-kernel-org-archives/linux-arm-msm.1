Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D05E4E4339
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660800; cv=none; b=mBVDn4KOxIfTYb2oHbbvwNd+iNEnWk8kDyin+AgK3EoOX2vfVvMCoyS34uhIjRDuE69gJervqZu/NT7cD5ejL4OExqalWUay7cbnWYcuJhi5rkGHQJPAEZU/GBUHDQ8jhwAU/9U8Gzf6LrRjkgomX4q0kem1nbmltMDpRiNSGZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660800; c=relaxed/simple;
	bh=tLgpMuWrxTdgXlfCAJ5LB4GG/gQYXb67tbrzvgKcf4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWcGXjXO4d/ej2GpOQtCp1LEaSSwOPcWLt5MUriJpcd4meExZwxRTuNThyUnS+khfGBmy2wSrlJ4MkF8UXJ3l1HMeRtFcshq+hkAIiVxCl/CrJ6SpsQc7VeG518QgHvaFtz9yDEntKRDTjAMEwVoSnvUCJhGeTtjUL0y19oUg+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dSLvNvIv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Md0iuP7x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dSLvNvIv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Md0iuP7x"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HEDFSh2497680
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x5j5s4nhgiam0hCBqrzwVhfK
	OSCVilYXlPifgN6u1u0=; b=dSLvNvIvtkEatE5f4mYWs/QhOF7wzzHzrTMINGF+
	AVKikYcx0OD88td9JSldjKXhoW7Vs0qRPYgtxT3KquVGkZp9/gppAt3Un+7ZRGYh
	mQe7qztcQKuXS+tx4y8D7QUxmscr+TiZSTt7dArM7gZ43WZLFs2AepAPsZdlyRbJ
	eWquYluM0p9VH29lnmQzff13G0pwV0bZxskajQFoPSs8wvC1RLTcqrM9NV5xWH3l
	R09SvhvsLgvIy3qNg0NW6P6zV0r3FW2zwhpnh7pOt/irmqTW7ecvFE8KDh/auChW
	PeT/kFTisxHW/BlvwnRx6a33qBo+jtZTKqEjdi6tH7R0tQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grhs6ggks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:59:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6fb956002so13503525ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789660797; x=1790265597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x5j5s4nhgiam0hCBqrzwVhfKOSCVilYXlPifgN6u1u0=;
        b=Md0iuP7xj6BLRr+Z5b8pEsoUHoZCNP0PCIAnMqSvEVSSF4ESP8gpUe0P8rQOyeZJT/
         EQaEIQB/uWDCSWP3CBGXvqPNZ8AAMpwP5HDec/R9kRwhvdnwZYfO26o/9vEh4vKmJ9i7
         h48SDrbXty2zhK6+r8cYIYo5UXGKLuwB1y7uxR6pouoYRwSDDa2bnzsl5KtYwcRgn+BN
         YCFu70MrPQYXDYqzE3Hd4Hf2P5jfeLIt797ETsxqH5jbeaexY97oHX26sYv/CDRbGc8R
         PudcHTXo4pyNRvcymOptyViO2gd5FsuSdfBpeOUtIhB0cjuJxmGWVF6yAfiL4GK5xzXY
         8+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789660797; x=1790265597;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x5j5s4nhgiam0hCBqrzwVhfKOSCVilYXlPifgN6u1u0=;
        b=n5qqHNG0fGdCuP7k0sUFuneAAIUztOPf8SV3IRCi0xtnrgcGnrorBbc7PDpGOAgXgt
         A1qacK5r+oCFRYYEmLFqEEsDlfzvaJ4dUnPxSQ34TnZ+v5NPUr3Qtf2R0g1L05ORrjpT
         7mcsfW5QklMf6IaRzNgaYi0qtCLM5dcmVIRMXix2eIMDZmfdbJfeVwTYVCQv5ZOxSdSP
         meihiTeloCw2rvOtRLVsvrRBwdoKqGA1L2LvSeTCOnRhGK9oCWi2JHSzx0bD2AmuBXLB
         5ksrX73n+pSS54Ug4cWFz2cyRaxsvHZI5O6ozrr/baxz91x9RIf5SPdBIGT9kEsGYzlg
         p3/w==
X-Forwarded-Encrypted: i=1; AKwUvBxEs4/HSzNiZfaIdDSupOk0RDfJhQCvsO+I8VbNwmyN96r83t06Pgw/9EdDmznIZxJsP7OOYd1YuppM+GfE@vger.kernel.org
X-Gm-Message-State: AFuF++nQ1up5lWn4CabfrL9f6HuPUNUDgx7CawrEWhLvtQfUOddup4Xc
	ht6abOVll4te0idEl7AiFF5FKJhFRWYPXTQDJ6vj15D1ZrWnegEPunb7u1xtAMUFEK5SZG9T5th
	Nu8/S5kWF1q4AxoaMcpcVw1XHhUtVuudjQu5/nMrLzjzIFV9AsBGhJocPFU/gNxRztMJn
X-Gm-Gg: AYBFou01HNkCfa3rcWCWNm1k7t3NP3wjsB3dJmljjvpdpF6AaiTQdmLfbg/2tqbq6yI
	kEdrIAc7zA7+FVYGEQcuz80OZPzkPQsOd64aG8/6dCd743lH+O0Ik7U2SV8fvBJOTAnmXsbSTRj
	9WhoDBFDI7CApUnMt+qH0o8/eE7JEC/E2GX9r40V50ONOqVPucJN4udrHJsmTS8ZjcwQgrVeHUX
	2yYeoRsqiljNeLe+wAK1A+J5Fq+fCNHRh2nqrlfm91ZORJV9EkoYK+LKIsCGgZyPX6kJB/oPyEi
	MN/qf0SHvog8Nwhrle8m3n4ao/fQyjoRWkyHH4v4i2akqaIU+oCiwyCBDqi8aKHSsF/P1zwF0Xg
	zetlggc06ajJX4A==
X-Received: by 2002:a17:902:ce81:b0:2db:479a:5127 with SMTP id d9443c01a7336-2dd8e632d7bmr152292695ad.19.1789660797162;
        Thu, 17 Sep 2026 08:59:57 -0700 (PDT)
X-Received: by 2002:a17:902:ce81:b0:2db:479a:5127 with SMTP id d9443c01a7336-2dd8e632d7bmr152292465ad.19.1789660796619;
        Thu, 17 Sep 2026 08:59:56 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f244c9sm29158325ad.76.2026.09.17.08.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:59:56 -0700 (PDT)
Date: Thu, 17 Sep 2026 21:29:49 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Thomas Karpiniec <tom.karpiniec@outlook.com>,
        Coia Prant <coiaprant@gmail.com>, netdev@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Choong Yong Liang <yong.liang.choong@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: stmmac: qcom-ethqos: advertise supported
 SerDes interfaces
Message-ID: <aqwOdSqxHDscsbIN@oss.qualcomm.com>
References: <CH3PR11MB8413FCBA598F7FABC04ADCFEE4B92@CH3PR11MB8413.namprd11.prod.outlook.com>
 <CH3PR11MB841353E5708DDD7C5E2EA1D5E4B92@CH3PR11MB8413.namprd11.prod.outlook.com>
 <aqqI9wOnradk9d7K@oss.qualcomm.com>
 <97924d2f-45f9-44d5-b482-97fcbb70abdc@bootlin.com>
 <CH3PR11MB8413131D50175690DF9FDAB0E4B82@CH3PR11MB8413.namprd11.prod.outlook.com>
 <3bdf2ecc-9dd1-428c-8841-36b1f19916e7@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bdf2ecc-9dd1-428c-8841-36b1f19916e7@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyNyBTYWx0ZWRfX5/bhY2V6lOc5
 vJkec7VHw5K3pi2XAeNHBceXV9314Joc9IuJQm2Z3ZHqHRxXYnKiZdSDIQikZnmIBHiGfaGuPfm
 MEf2pckBGCkuNPeK5rJElSSPxBvdezI87fwEbwYC4lu/gLcdtHVVf4Nfx7Ksx62WQFsm/wA350R
 lig3MiiwmY+zH3P8doRBta/RZJUprO9sLGL6P/F/xOC1Onwy3ksyuyha0xg2O1ekGpcPhVnrHIr
 3XuLcokuhJLRNIb+JNuyOTCGvJtWI/zDecSVE4jGiRnT2iEjtCsTiyymQaJEm1e1Go2jEe+xJjh
 JN7tMQfYD7yoGXBpUVsAMU9opDH4CjU4e+YvlrzuIhQTW7eXgTRT35QlqxyC9z/GNOcLFMvVGB1
 J5FheRKAyu/Pxi20jwuJgzaKXj73jHFtAYErV3izII3JlLAotQuoJCCr32PgRUHfM5arG++GJss
 smABoJT3D9QqLvi12nw==
X-Proofpoint-GUID: YESjSLY_szE0QPme2cSEtVqg86uDgfuV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyNyBTYWx0ZWRfX5O0biBaS/dFi
 snGM8PuNDhL6KRIYknTrMtYP7VgEJZkAf5OSsd4rbbrQxoPm1uN0s12hrGykpiO2fH7d4BT/eTD
 YsdTtIVZ1JuiDmuc0WYzj/VrTPn8ze0=
X-Proofpoint-ORIG-GUID: YESjSLY_szE0QPme2cSEtVqg86uDgfuV
X-Authority-Analysis: v=2.4 cv=cvwOAF4i c=1 sm=1 tr=0 ts=6aac0e7e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=aHOOhSd_e6fbb9z57_EA:9 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170227

On Thu, Sep 17, 2026 at 07:36:42AM +0200, Maxime Chevallier wrote:
> On 9/17/26 06:29, Thomas Karpiniec wrote:
> > This POC did show that STMMAC_FLAG_SERDES_SUPPORTS_2500M enabled phylink to configure the integrated PCS for 2500BASE-X and a 2.5 Gbps link came up with no apparent issues.
> 
> Maybe the blind spot is inband aneg. Mohd, you were quite involved in
> this, do you remember where we stand on that front ?
> 

That sounds about right. Let me go through the older emails and the logs
I had captured at the time to jog my memory.

Thomas, it would be useful to know if switching between 1G and 2.5G
causes any PCS instability. I remember that particular test case causing
a lot of SerDes link flapping.

Note that I was testing the QCS9100 board which has the AQR115C PHY (and
due to its rate matching capabilities, phylink presents all speeds by
default, unlike QCA8081).

In parallel, I will try to test out boards with both of these PHYs as
well.

	Ayaan
