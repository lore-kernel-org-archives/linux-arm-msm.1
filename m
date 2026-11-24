Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521386;
	b=K/vwzSEE0PlFviqEH9qan8Rxe47iPNn4RN4fLTFvInPOj5pGP0Y9ao8i1h3T4wSp6zaN
	 U6tYsoCZpu4mNobsCdtKEMyMxfbaV3BOmDjWawTpbE8krDUEHJ2Eqw7Jg8tbGwv5i+5Ef
	 sl9D/1vDvOs8msYNTEhQb8II4W7XugjS3ut6+BwcOVS1MgoxAY8tYjgIEd3qktBe63WVr
	 IK/P9WE7oZ6xXahsyj17y9s0YVJAse4ZSBT+Dpr3o/H68CcSKPiYH40TFzAUMMecN+k0E
	 u6Tk7NSDVeZ4QXUJ67n0dC5cN/d+XtKbY10ejR1TYaLYkAsrYiy8qfIsGFHesW9XwDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521386;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qiJdwOJzBM6Kd1w598aMZRytqMeSnmHW/XmVJ2AjRfc=;
	b=FwpUWSD/FRdT5SPRVDcrS5do1os7/XjB0gSQFTkNwJMf6Tvukfy+YgWFnGObanq4d2xO
	 8ckHFJlJ1km0VKbc13A2rx8+/9+Jc897d1db4SHp/Uj+CT6wf4ZUWLuOKss5Rq+J8rhHt
	 wdDBKyEEbiGt3v/7Y7JATORAdo5WOdX/gyDp8tADj7Sc1wohOhdvffqvUU2fMQ/08whPR
	 vVHBmeAPfco6SdvTIKtrL8CcVagVLf2kdADqW03LXKLBS8XGbf1H1RTeG4tyB7erI/Q5Y
	 pQ1TFJbSNWI9RYWWu2qxrssCT7Jo497qmjRGy80TJ3R1UfQ/y+3Lo1VM702bF9wo1Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Nxx//tJE";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHUiewJC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3426C606A326
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 11:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3426C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nxx//tJE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHUiewJC
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuKhZ636658
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 11:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qiJdwOJzBM6Kd1w598aMZRyt
	qMeSnmHW/XmVJ2AjRfc=; b=Nxx//tJEuRhKaWvnXEsr7ScrUeXod/e92f006Vut
	R2NVMCBIkodXOR2yMuJEPkDFPq2TLnLhFqon+sCO+BQR6PwCPXSbZcWL0b1ANd1d
	J7EkB7at4972z4M8cdKaU6D0Ci5hxBgvVWKcIjEQR2Bt39P8xZUX08SvNdDn/ItF
	r1frv/UOGmmi/J0MNVn7xt/4/ccr3KWbpC+tlnDl8lZn3Y4CDNI13QAjiSXvr34B
	aMDLTcSOJ2OCx54rV/QWSWs3OionBPeT4ihyCddbXKzwNklyLjVUU1wulBePn0oG
	w9KRhA/TWy1Q86pRRZrlnL+rV4hi9rkkJsNrZf/8+7u47w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rphhye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 11:56:23 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso4637531c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 03:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795521383; x=1796126183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qiJdwOJzBM6Kd1w598aMZRytqMeSnmHW/XmVJ2AjRfc=;
        b=jHUiewJCLezAMwgz7kRicDKbISqfg1rtZzbj5O7WfMq5pgUtVyzgBIAQd7G4ZZtYe/
         HTdPxnzujwqjNsOr4gh5/SfnoGbKqe9cewmCjHvcVr0P3YNH1NUVDwIEbLwp+u+8TTSM
         Ch5Rhy+Ctr3UqiTRc60JbLozMrUkG47GdsChTBHKuuGj+WmArJK51cQQoznVxRRuX/eR
         +TQp5qRERlQSKxcUCG5VKRPMcDI7MIgtwz441wpiyJBQJ/BTCSTinLRFjyynLVZkaTqJ
         sdHbizXcAnfPaIPGSPVaj47iNPq58HBB5TesJov50OxZe30hbJDBAABLfYb0db7e3+ks
         GgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521383; x=1796126183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qiJdwOJzBM6Kd1w598aMZRytqMeSnmHW/XmVJ2AjRfc=;
        b=eUgwdykfi/ulpn7pp7bY24PVvAfIOrzDsd+D+W04n3MOnjYn8lTHuWgpKGM0U4jEQ6
         FCeKSQ1AlwpT8nLi/34aC+B2GrfdzOsyqxpI/Pj/BivaiDmqUi3Kdzag7wq0h/oEbMgl
         JvQC0/fUlDDGb4MxD0pfP7yvzv/Sb0U1ef1/gY6WR7wO/JBr6QPGXa8ys9RxSoQf3rlg
         EFka+NYEqqa2W3wN1AgpUt78klf5wltEnMggmEHGFl3mIqApTKKpv8kXGYubwYzcB1pz
         11jY6LkEW3HP302JN+c9c3p4tPK+qMGHGPv0i0mf3u7r5avjkq6bCyPbvrmJJ3pq9m+R
         qvHg==
X-Forwarded-Encrypted: i=1; AL+hErGsGfYaF/RFWUgAPwRC77hBY8SHkyNoBSSHPzmzSt9GlN/OjUZeVTcTOBJPk6/JLvMayYMyOdND57wWZFct@vger.kernel.org
X-Gm-Message-State: APuU4Z9Gm54DWmFCCL/PzD6Q2B5TDjdLrEHjByPz6w2gwzlfZdFf5dgb
	50UwGUulKQmU1WaTL9hL6PadzvtSK1j/MOSTj+uBAVI72/1OQ+mfBWPvyxkBXpas93R5i0omegT
	LrCwdrQF0/Cwr0RKqQvk7jbWh5a3TMtcOGK48YPBfHEbHjsrzB9yKegY/ROs27NAJUNst
X-Gm-Gg: AZFdTZf6AOA1wWvMRpSiXVfpzu8FtaApmFz1pFN+KZ0O2kMrcLPlj8AyLVXT7h3WTnn
	pH0DBNxTQhtBGmstP5zJ31qfozMYwfVS4ErWxViaaptdsw+KNz8QH5or4ITGQmwvpvWv4rB2lN1
	lkVsTymyFxChTmQLx541YLLxJz5STDNU3XvyaQppJsfTPvwxgnp8tgcQaPMmHkOxKXp4wWv8fdA
	vwkqcJGTe0lPYIrLOHvvVXZsmiCh/WfHuLzulOnEB/Hx7WwTPNLvrTxoSPqebSmoj+b2Gwh6Gip
	Tu1eQYHt+/K67F6IqeP/fD6nEVq0AuduIdacM/ggVImBnyEXyGVIXnz62Kae8OF+2UauGWcGNaQ
	zs4zRifnv8hEXBLzJ4qgnft2Hc4WPJe8GprURq1vNIsdsZ45gCJmi8ZtSrqWZivMSv2JZTkXIVY
	bh
X-Received: by 2002:a05:701b:4591:10b0:143:297c:276c with SMTP id a92af1059eb24-1b55691aac2mr12967278c88.33.1795521382767;
        Tue, 24 Nov 2026 03:56:22 -0800 (PST)
X-Received: by 2002:a05:701b:4591:10b0:143:297c:276c with SMTP id a92af1059eb24-1b55691aac2mr12967252c88.33.1795521382015;
        Tue, 24 Nov 2026 03:56:22 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm35145257c88.10.2026.11.24.03.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:56:21 -0800 (PST)
Date: Tue, 24 Nov 2026 17:26:14 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Yadu M G <yadu.mg@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: qcom: Add Seca TLMM support
Message-ID: <20261124115614.cqzo6ilr2shmzrxa@hu-mojha-hyd.qualcomm.com>
References: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
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
In-Reply-To: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NiBTYWx0ZWRfX7PpkIDOGQePm
 IAQ13QikPZvdh5JQv6aes+Ly9XwLD+RpWgw8BW8HFKeAArO5LIL3pL6HsOs1I7DlubP/05dDoio
 ZeS84eE0lS0iTvQ0v4YRhBy8leqDsVIgMFwbacvgNuukagbvLxEuAovHD9FS0TezrKuosLVhZEl
 Lyq78XAO1Nnft68ELOfSjornBca5CBFtrCLbI32Rn0lXSxbQYzBRbEKZaMKC8Arq0Bk04K6Zkc2
 JgVwkVxn5F/qPqy+OkCmGarKs/2TPMtvDydpArRvIiyzbEiyy3NT6AbanvLvV/kmcesm9eT/Xrl
 jv41edPK7gRhxIjhHKHgJpA2iLPoUEqTyBMK+9bVcohEdImlpcHsJpKn0/RkJtcX9f89Fw0PS8S
 EtxxM5M/xIuhysvm6QDC6BRtN9FILd2XSKkHtnqrFTB7Fg1ffr7k0x510u+q0AQaq1lGf5/FFPO
 qgfVZst90GUMKH+ADcw==
X-Proofpoint-GUID: erImQU3O9vu_pyNQJ87T_9QXt_3Ox82G
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b057b67 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=6J28aJzw-_SWfeiIoy8A:9 a=CjuIK1q_8ugA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NiBTYWx0ZWRfX/YI72ybLJ4rS
 XCAU7x+45vaiOqLcSI7Tk6LSJ5fuhzFinOQSDseyqS/lSrSI3dONAYDqcW3UxXyEn1ZWt2y9p3v
 5ZroKq5kOiDWKnSdPaIjI5qXWW8c2Uc=
X-Proofpoint-ORIG-GUID: erImQU3O9vu_pyNQJ87T_9QXt_3Ox82G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240046

On Tue, Nov 24, 2026 at 04:23:01PM +0530, Yadu M G wrote:
> Add the TLMM pin controller binding and driver for the Qualcomm Seca
> automotive SoC.

Where is the introduction of Seca ? what is  Seca..?

> 
> This series was prepared with help from an AI coding assistant
> (Claude). It assisted with review on the device tree, bindings and
> driver (formatting and alignment fixes), rewording commit messages,
> and running the validation steps (checkpatch, dt_binding_check,
> dtbs_check and W=1 builds). All changes were reviewed and tested on the
> Seca Ride board.
> 
> Yadu M G (2):
>   dt-bindings: pinctrl: qcom: Add Seca TLMM bindings
>   pinctrl: qcom: Add seca pinctrl driver
> 
>  .../bindings/pinctrl/qcom,seca-tlmm.yaml      |  135 ++
>  drivers/pinctrl/qcom/Kconfig.msm              |   11 +
>  drivers/pinctrl/qcom/Makefile                 |    1 +
>  drivers/pinctrl/qcom/pinctrl-seca.c           | 1705 +++++++++++++++++
>  4 files changed, 1852 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,seca-tlmm.yaml
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-seca.c
> 
> 
> base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
> -- 
> 2.43.0
> 

-- 
-Mukesh Ojha
