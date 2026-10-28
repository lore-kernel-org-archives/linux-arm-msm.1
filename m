Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188069;
	b=Lr6TPQLoenv5q1IkluVk4b6Ahlymkm9RxXAOBLubGMLQlM3mE+h7upABb+EZHsL+Kvw9
	 C4mG5s/ccqfC5ICe/duProVgaITLrtNS19y6PuSh1mKZk+fjuPJOTpUScg6ZwfqxO5L3i
	 9BNpzHzuw8XRyRX2KqIkj1L3qW5ZZdY+QNmhuLYqt4AF4TOO24q319VFOcbnzx4TLW6bs
	 +zWizzhkkSIPTLVmECpV16v9U5vIUPps5LlJKCNCrfUAe5OTMIeTQ1PPE8zAuFPxni+6G
	 5l33dnCVizg8qIWdvQfM0dIWyVYMPiKWQwLtzGHwk3OeurugkSjEtnTj/onVNayp/Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188069;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pCGUXGj4ZDfvuqM5yiaQoMgaic2cUqs7MWwZJYPNXIs=;
	b=aqYMVNR3vH9fNbOn96GCNE7kXP3v3nZgK+vFQTh9kKoXdT8+gc8jY1GALDou6Udq6Z9R
	 2gK4EiSh/Wsj8vZT/OJ+hdV+W1krLuTdhFMNtkNos0higBSEZtWaQs4ldchOkSEC5C0Xw
	 bUavewzqaoMND1OBcrSjpNggQznnjEL0B/bDFGIRhUdd0D+e/oBP741yUkzrXZMDis6yN
	 9gM3FJBFUlsJjmc8gmXiMpZ6j3yBQ/kK+DuLTvvVSZD2yKGnA5QR9MeAscd5ONUi9ABvP
	 8PhDaBpjQUJK/uaoG/akY3fIM1jftdq5cZuQft7RGrRynWEuRjAo3ehcBdy8SpB0vfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRk+cJvT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IpE25sF4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A91606A322
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A91606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRk+cJvT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IpE25sF4
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeYVK693388
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pCGUXGj4ZDfvuqM5yiaQoMgaic2cUqs7MWwZJYPNXIs=; b=TRk+cJvThlrWvgUv
	rRTBz/Rw9AnzGLidu6z08uAbGk4UazAMri/Q/nTdPIfPe8hV0fBdjTKHzWdOUvA6
	SPNn8xzWgw3TVcz50heEgFer+p8rWas3ePyTTEaALZcRh96qm18UZtAmeWtpetOj
	qSWsXZ6ChUZzvjZ5yLXCh3NOf0RQLMQ9kiaU2NqANrRxLVaNjTYKx7PA0Tpr2c5Z
	4N6mrIVMPeA8iZuMvRQIenS6aV+kplnji6LuVS1Cp7UvxiCA76TrEjjalPZ/0wBC
	ojdt6StbSSxUMu4YI6olw05K347k+YDd0+zZ3W9OY5+Ze654i10JQqdhCqR+H43F
	hG95iQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be290n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:47:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e60770381cso9373525ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188067; x=1793792867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCGUXGj4ZDfvuqM5yiaQoMgaic2cUqs7MWwZJYPNXIs=;
        b=IpE25sF4NU4Y2k2B2UhEXa3E6TPUejAGm0/pgxHIsfQjdpZRsbwlhCoLp3Objddv6I
         DCe7msscxVbeg4/grI4tHOyuAQm38fiWoDXXMgQkUo7k9boM5ikjMUImuO+dRzwzrDkA
         hWsntFO4qP3hTIetR0PSxZ1prNgynj4tVjUb12aUzfUYktqaK4Y+MYFtDh1gg/XyCsel
         h+8BE1Pba0a2G+SxmXon/bCozVdowFTLnPBlkWVpAxZ48w/Xb0JoaXvINhs+nFkNu3sE
         RydleITf//n1XUP45P2wn9ekxZa3IBuPygbAR/ISahNuCFDs3dSlalpC4XUINdlzUTuz
         QYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188067; x=1793792867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCGUXGj4ZDfvuqM5yiaQoMgaic2cUqs7MWwZJYPNXIs=;
        b=LmHGRuV22Plo5zwnl6yOLnmbxdoNUnP/t7UXT5/Lyfus7umXZfdvJbsAMtIPuqiczR
         0oTfdUjqh3OzE9Za65N1/SQH4V+15BvP7xk3buQeMK9VALipeXq9xh3Avoe3wU6DViBe
         kX+ATSaToX79zf4xgUnyvSwGiS93aEmpppfVeEracRLS6eAA876xeQTegKqeE/xXEXRa
         Ly1Zdt8aRj2aQbEHRWWzwy+8B33zgrqUOsW4kuVr/3KytXKfD+dYUF7T93vcpuZ/0VDW
         WFgmpxlzMCjTg/jhgYKaPS4X6VIxm1byxml017oOXVILk5Zrut6RYg63E5/CeL+H5D0B
         4JiA==
X-Forwarded-Encrypted: i=1; AKwUvBwAr3OpShgURntt8fi7U5kbN7yNDChPzKcEFm6YAQtJRoVkxvX/Xc7n8a2ri00utmahDkJWHzq2XLekffWL@vger.kernel.org
X-Gm-Message-State: AFq9FYJqUegTYlItuc3h0XYwFQ3baXuqvK0JawU71cgSm8ahcc8N+q1P
	NJQ3Ma+0n+Ta87Ok+KMyzyna4PpnkGSBWChPzBTi32XQpETSdqiklwUJTUSz5x1K2xsOlqdzw/1
	8HSneYS7tSpaGKxmSzxLTS13uMDysZB0/nlVlMVNnt6n6KFwKNfKC2FHGTLhlkdgi2TH2
X-Gm-Gg: AYBFou0o2aq1L3ikn5Euo0QIGJgw/3tUGS0v5wdN+vaCehQ4X0EhXfLtI7P7va4TYhS
	ad+pZfkwNmyMD8jaiLk74p9CQJ+0XFAV3SGABGFthI4U3uUdjZpNhAh0NuV/PETspry1Itn7bHz
	XCdwKze55LPtCx2wlAnaOs9qaqzraBqVNixGHdc5jradbhxypDf1Wq3nimW6Z0nGOxZ+IZ4gAdf
	MBVMJVWZKPX44tTcqDGRcb7ZNWTm/HvTtrDFDv5g2Dp1y08nRAdFCcdapTObmmmcat4RSstbq/B
	89CspjxPiSQ8YBhYYq13RJgIhSP50qpGjNruS2ik8DtFBR3VuLxTaOVQd92bTAEtWhvHUtl8eyA
	WNDUMbDXLometCRe0D2uAymEE/zntB52Z8QVy14Yc6BVdTbmHTmCKfAqNSkvkxgsod3eDRAWo5p
	dPkjvDgVXhvcQi3MfO1wca8m5rYuzF
X-Received: by 2002:a17:902:c94d:b0:2df:9497:3c89 with SMTP id d9443c01a7336-2eb004b1de5mr18458585ad.59.1793188066552;
        Wed, 28 Oct 2026 04:47:46 -0700 (PDT)
X-Received: by 2002:a17:902:c94d:b0:2df:9497:3c89 with SMTP id d9443c01a7336-2eb004b1de5mr18458135ad.59.1793188065798;
        Wed, 28 Oct 2026 04:47:45 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:47:45 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:41 +0800
Subject: [PATCH v4 1/6] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-1-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188043; l=1130;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Fdpc/cwPO/s0yoI6hre67PeGTToBFG3hV8kaAFSlrjU=;
 b=UXyHBEaTAEOkqMTuwB7THPKdjj01ssGYxm/IfpMHdxA7r668oZktRwEdGTTMV42sxolaMW+xY
 FtJ+bPI8nSvAFSvvjAcwSSuLrsk3Jwr1Ce18R83ntKIzfGc9iWxpMzn
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: c0gL0FGD2_kSGAnTpdp4nDkQwr7NmSYW
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1e0e3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=cxiLKowE09Ysm4E8lmYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX4RgF08l9bSRJ
 kWVcwadP9QJYNb00gfgSeF5dXkpjE4FvPxPkFFcMjHbRwJeCuILg7zO7Yk2dvRDXovjKoZPk/R6
 lizlHblFLFJXjVfR8ZWV4ZrymLB57VI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX12JVoJP7xXlo
 vQttsfIGlwZ6fi6Is4YozO0jLL/U9TLqE1KnVgmZuPVcamw5Bs2GLmx99wzE3upAYwEVzMbbAal
 LAGkx7ieZwFNO+gkap1d1Ri+BMc9Fe947EBB33vRuALqQaNAyQFyQq5/XhQHH2HdfY1RMnp7kAv
 QwElzYtR5Wfum/EKLr/y9RUxtVAPRcx0djqPTqsXVT27cIVD6pIsZbs2qBGh77s2EZ0daZQx+WG
 XZVnvi8BKhmLQJy9S94NG3ZUlyD7MOUa1p3eIKTRcZQ8nsvIM+2UwXkkHpXT/VVdZ9CsN9AQo4c
 XAUMpfqc6SVXCt1quhru2GGf0CK1Vh9LQNl9KXMxtiQy7lf3D6a0BgJ5lLp5NdvsVsW517jvF1w
 fzWpftisIEXaa2mmtW9nePoGbRxC3YFvTAnXvz0UD6xlZ7Xgf2iNlZ7UmlDv4AZRn0XpU9R5mLb
 6l9BPBHIMLPUOGtLmJQ==
X-Proofpoint-GUID: c0gL0FGD2_kSGAnTpdp4nDkQwr7NmSYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280046

The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
is defined as 16, so the check should use >= to reject index 16 and
above. The previous > check incorrectly accepted index 16 as valid.

Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 48adc49b833c..347a5a6d6a1d 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -700,7 +700,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 
 	lockdep_assert_held(&mpam_list_lock);
 
-	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
+	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
 		return -EINVAL;
 
 	if (test_and_set_bit(ris_idx, &msc->ris_idxs))

-- 
2.34.1

