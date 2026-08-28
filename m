Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6093AF664
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912278; cv=none; b=i6sszjkhbysjUF7D098XiJfT/MDTe8MXE05jcVMSX78UqSF7loT+vl4L9t8DZFHj833uzmdFGvUzecX4E5GqCcR7SlESy+fglT9lphCgsNCNz7E3BdPHEckmEYkbGbrwU+8PAU21n4QpfhSO6MHSph++srV/HgO2oPQpY8vh9aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912278; c=relaxed/simple;
	bh=qonRrWabTY2Twu6xyostniAUyFpKLy2UsRhWt4rvXKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfno0xuOALzYA4C0Hx2M0dopgOnGQLNyl2XBtLBHDG3zgILvs1iYTe/yWWu638+g6R3SGaZHnSkb8J5A6FX8mrAbgCqZ8ebDCjC6EzLm00EX1e8mulQa3SMokgdEjGarXIGrH40YQmnm3JSoiLSM24hb5dBRso+H2CKQxdPznWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJRQnfrr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dm6Zbt/Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJRQnfrr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dm6Zbt/Z"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7c1Y2744796
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zXRfRBSvmOBEWYCw0NcTobyt
	JHxb0TUjVtAqtsGGYto=; b=JJRQnfrrSqn+7SxPsN+KkI26FGtHGKpjExCWkLUE
	Ny/NxOoX6GaXiOS7hQXDo219MS1h16VXQM+GR4rmCx2D1iTFWLjQsrzeOc3vka7a
	+fthdmHpXKCBBlV6xDeNhENihWW8WnFzg//8wMYnWViAUUCPRq6sJN1PeNH8ZDP2
	EVJRvRIgnlQOsb7l1DG+wOOy8A8ZdksGXkrV8VbEHUMcF/Mk4ov5a19XB2S/lSxr
	qrBReBZPm38Z8YGmjQ2Tu5KSwEBIquhzJqUmQ7zKN/bdeKAvquXNVxujbHFz1Wol
	HsSuwoJsoII5MGkzh2fzTD73xLgrR4Og6pQRWx8EyP4F2Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mxs8sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 10:17:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ef04756caso9308461cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 03:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787912275; x=1788517075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zXRfRBSvmOBEWYCw0NcTobytJHxb0TUjVtAqtsGGYto=;
        b=Dm6Zbt/ZD1Eh95C+0+E6RvLNh7Kwer4hr3/YagKnzulTcO1XZK/5zScffkraSkQcbl
         a/E8jyurxylBeCD6gz/Q7D9PoRQ6QPox0QdLYxfa/FljDOSCAu2C+HKjTVvmysPhBe0y
         mnMTsiSZJ7UdqIjCVDvIz54jR0TtkXGjDA1ksVW8EHKB2ydK0i3jlixMP08DLvMMrE71
         F4fFRfXD68A6XzzVUIaWEcV9evVZUSbOG3OnQZP4QDRNzjj9ZZmidJlJ+j+bW97YD17p
         JG8PlyNMUS40vHenI5Xvdk9Z5JPbQRMUnuK/zTeV2Lx1NbsGxwuh/88Yb/McYHzTxIuZ
         +ITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787912275; x=1788517075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zXRfRBSvmOBEWYCw0NcTobytJHxb0TUjVtAqtsGGYto=;
        b=Ch4IPtHbgaCVwFx1VKszTo9ROEDOufTKpnFVXk4REchWEjmcLxm72nCgMovCL9rpmW
         XAvZp8cb6Z0OtPDQ8P44xMAMiaTwQNuskKGS21SaLWWkbDqAfP+Tf7zbljTs4kQM5ypI
         DsFQRz8i9uhnV0H+6QkFtnBbdp7cprJr2rYwcXqSVoQNGT7ARDpSLzMdVQ1o+521xND4
         BXAXsb9jsGvMrwaMczuAXG7jJWQ/JGN1hMWZt+7DAXEF5iScM04AGEU5h87btahfXOTh
         5RMzyjCjxPfbmm6zlFXpHz3iQ4qL+ShNVJj4EHbhkVZFJmnaiE++QBeCATi1fZtC9tSp
         EWHQ==
X-Forwarded-Encrypted: i=1; AHgh+Roaa3ezxp/nvDLObj05GU4irOv94DZ+/bKG8uJZsLX5YAwIAmqs7s24MCC9f5AuRzsEQyULDgd8AXWMiJeE@vger.kernel.org
X-Gm-Message-State: AFuF++lStTGzfKK+MsQcrKmB0l2wkDoYbzMKIZMnCOk4TQT00YvPWJh4
	u5kOiYOd1JEB8F6V4A7mK8uPvN5tvptvVX6+tHNk6yxXP05FBqKIVDv88/YJ5bO7QhR4kAVPQSB
	LUEqyVcuNVRgJU4v+m/P2hICSC5A8XGn+Ao+Np794X8ABoLS+uNQOGCj/Tpl2/FLFgTa9
X-Gm-Gg: AR+sD12/AqsXE1ggFzx+xyU9iZI0Rkxn4Z7uz5d42+8DmgW8ja5pRQi9Jd4Z3h3h7ot
	wgrWyfupSDFZsVrehIz2l/fmSX6XfFo9sgKF5eXfQgGLKhOAvwK2dz66TC3j9UOouYO6kGLdKS3
	OepDv2W753A69WTkTfv+FMNzBXVTg6lFhQt6eZ0n5D1A8rjtoomAtvbVDr0zrq98Z6qa5O5gZ3x
	tNC3rW0NUFst18EgPlfDVKiJeuxXBXeqbIGgBdQ/kumMx2v9npbbrxpbuzNas7C5S9TIGRniraY
	Fck9kXRZcshx0VvyjvUlLU6bWsJ1XXp/M9JnymGBBWpH8HOtSBCT1YEo39IoYVbgvEHam+5FUq1
	bDAiI+21voU/p
X-Received: by 2002:ac8:5cd5:0:b0:517:906b:c043 with SMTP id d75a77b69052e-52fb965f4d1mr74562411cf.36.1787912275015;
        Fri, 28 Aug 2026 03:17:55 -0700 (PDT)
X-Received: by 2002:ac8:5cd5:0:b0:517:906b:c043 with SMTP id d75a77b69052e-52fb965f4d1mr74561971cf.36.1787912274497;
        Fri, 28 Aug 2026 03:17:54 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4942298fsm118166165e9.1.2026.08.28.03.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:17:52 -0700 (PDT)
Date: Fri, 28 Aug 2026 13:17:51 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/4] phy: qualcomm: qmp-combo: Rework DP PHY runtime
 configuration
Message-ID: <5dlmduld25xbmfqm4as55pdxunts33wrpy2piybiuqpkw3t4ua@inu36526ekkw>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-4-8e73ce7c4636@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828-glymur-phy-v3-v3-4-8e73ce7c4636@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4OCBTYWx0ZWRfXyB+aIqw48kHn
 OmoOqAhKUqli/Cj81n/4dn6R6Dc+tgrxTUnQnFzm0DgQWjvjI8s+WqlgnTLVe6NvqzYz0zwGVal
 h0Sog92RhGrZQZZRwOA8LTuI3gZ+tblCdDL9Pfm1cPtlrBB2hHujSvKW/GDxQxT+K31+qyChsau
 Dbjjy5Sf3ohcGUsrlVMBSzxucHKGPphY8C47jNYYyBimjqkn3La6MAiCb37qhTWhBRw4501uwyl
 WTszht4XIAW7kdaKnw8MHMKPkr27VvNtszuEX4V7sP/hHidD9oIrq2iL7W193kec1Ikeag4nvmN
 Cjcto3rNsfU2pKkfS8jJM3FOgKsdp04XtXK0s8Urw+1w2BI/bo2WH8nszfnYeeHGmuAwn+AGnP3
 1Zw90dz6hUuBi/yoqYh0Or/aMAbHsrlLpf9tMhjCqPAD/O16ab0SKMgfQUYQrIxID2hPgEd9iCg
 FIUuzba8acnqDzGdwNA==
X-Authority-Analysis: v=2.4 cv=MONQXsZl c=1 sm=1 tr=0 ts=6a916053 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=lS0QMqM3BESs-n2QcPcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4OCBTYWx0ZWRfX5p61G2Pm6pmU
 5OFNxUKRC3hJkFVbDNmg8SSBULM4/b3e3kP9GEyqKK4vKklxK+TohcmxzNmG73HYdq5ldh4gaji
 zRAeNCZwVTQLP/9EQoFAUCIub8aePUY=
X-Proofpoint-ORIG-GUID: 969j6Bhb_zvpEU1t8h72L_lUCzFvCqWI
X-Proofpoint-GUID: 969j6Bhb_zvpEU1t8h72L_lUCzFvCqWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280088

On 26-08-28 15:13:16, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Rework the DP PHY runtime configuration by:
> - Extracting common DP PHY initialization sequence into
>   qmp_combo_configure_dp_phy_common() function that is shared
>   between qmp_v456_configure_dp_phy() and qmp_v8_configure_dp_phy()
> - Adding dp_aux_cfg2 field to qmp_phy_cfg structure to store the
>   hardware-specific AUX_CFG2 register value
> - Defining named constants (QSERDES_DP_PHY_AUX_CFG2_V456 and
>   QSERDES_DP_PHY_AUX_CFG2_V8) for better code readability
>   and maintainability
> - Adding validation check to ensure dp_aux_cfg2 is properly
>   configured for all hardware variants
> - Updating qmp_v8_dp_aux_init() with corrected power-down control and
>   bias enable settings
> - Modifying qmp_v8_configure_dp_clocks() to add VCO divider programming
>   and update auxless/LFPS timing parameters
> - Refining qmp_v8_configure_dp_phy() with updated driver enable values,
>   TSYNC override sequence, and additional status checks for proper
>   PHY lock verification
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
