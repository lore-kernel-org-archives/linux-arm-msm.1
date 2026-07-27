Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3668641A904
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785160718; cv=none; b=dpptZP1zASylGedBqnJVSmfiWBlbzDwTsosd94of9iyL4lzX1jTt/ZkCKDidBobl4cFzyeBy4QjQ70wrcn8KzrRoUF0aPWOWkCyK70uCLFsjr5w2Q2f4cptcB3BbUcc5datOml/EI/ytsWf2wYUr8KawfJhw5Af/D3Jwv4z1hkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785160718; c=relaxed/simple;
	bh=zTR59WAMTem5k/i85razqwz30zDny9bvWqtO2HLjxVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/OfMiTNypIrRZDUgF/1PYXYMoyW3MDaU/MlDSsixdLRAXDS4HNE9CW4KfmiStQNMzKwtTISjhTUnM4HjCf3wqVrnNGNq+Su4q3yiopp6qNoj8tuvOFttBdNPNe9kPYNZEDBP9y+lg4AGFz7V/EKWLqyuas1gmBBxuUyFWie+I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0gd/pdL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dOF5mcOL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0gd/pdL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dOF5mcOL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlaOi3905423
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u+7stY2hW2TFBhJexcpx0/1A
	bMcvQRNAHXeVTkGXnFM=; b=G0gd/pdLn4ZtxFKf3zRSL0+Ci6RNP7SuVivW7u9Y
	wXLY8PHJjFkDhOA6UI+OM5XxNiky4gcb1x5upniz630R5ue2QFJsTq3XFWYulmbl
	OKpU+oUrY/B33hoeJ0bygWmia8Ys8n19VuC5M6qO4ItfrkIjSnZk+5m9Sj4/FeUr
	GWkLeezgIT/5x+VmHkM820TIJl5BL2SJp2SjhDsKZ0IiSg2egnwHU0haov/e8gtY
	ZODveWvzl0b2EzJB8cw0VysdxjXLnmmhBf54Y0zclHVCNLt75f4NZC7nxNIr5cKd
	lgays5r6+1rzHUjdiTdEZSRtNgvXYA6Gv5Lq8CyHJKmH5g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4ukrxva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 13:58:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0e702df8so33533281cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 06:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785160713; x=1785765513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u+7stY2hW2TFBhJexcpx0/1AbMcvQRNAHXeVTkGXnFM=;
        b=dOF5mcOLJZjnqfHcehaN20bicqZ+6/H3irmgOi9AR7OVzxArc1Wb8nXZbl14RNGOZ3
         Zqj7asohshlnQNHgbVg9pHUGh2JDFIJHKOWnH4/gIC0UKqKlZRdbNarohVAJEanSCWWX
         UTtSzdWEBmYp4rPOdFsAdLbaxCViSJjUueMpHCp2XogUCzgFRcNW502nsjwo1im6Tc3h
         JQrFfvxM0qUfYhCOVkMhfGq0KA93uVMlvjzdmWnriohCzKtYSPkE7ZLr0LiLOu9ieL74
         H4g/DXw93pL6pBbl8xzBALjotvsHC8p3hYEJmzgX4oJbK7JjZZpFKHj+rOseFLvk68y9
         2BKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160713; x=1785765513;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+7stY2hW2TFBhJexcpx0/1AbMcvQRNAHXeVTkGXnFM=;
        b=FqQxf1cuWq1MiKKO0CMqcfGKs7EOlQqhU0vZmFLedKVdqdIgRH2rJSYDduBvX+EJUx
         OvBzNqdJwB4xMxbA4auicLz7oVwFcQgIReIDs+CVpi9LEEfhsY10ZDn4Z7E1elHcTMQv
         Zs6K+7WpSxCLxzE1y7rW2utLSpTqMK2iWZ+msm/0hzrcRNWk33W/tUM0FyRd+hr2XsUj
         60tWRxAy8laUfbJcAFMD0PYR1ZbTjG3Lc6VVA0F9Q9/Ru/3miag7de+Bx2sMHsw+Md8v
         q2vqj/fSLIhp1aIJesqBA6O/U5RTduH89xSSX5s38863opCzeqgnCx9C6DF5X6eafzSm
         BGFg==
X-Forwarded-Encrypted: i=1; AHgh+RqPqCL2wZGpedgLaSNih7K6y1O2U97YvP3LLCglxkQdKwSM4mbYyN52Tu4p0QB+3JUqTzT7+gEtWz1m0XKK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Q2E4ibFJcOqMmlRLuRBZSuFPYBxAIJBp89QW275YjeORYQV3
	tnX8SvPAjkSeH0jEX/9Uucp9SBsxJjhkO1YBLmvFIWK6Fpoz/dDCBq8Wl799ChQOvWmdelpkZKs
	4OroF23v6YK5Rb4vUhHCGYmHqTGJ+dSdGY1W7TlxxvG2k8YTE9xCtcGX1jtJ1+mpy0DHc
X-Gm-Gg: AR+sD13RlSjZUuFzg7pQRw2wVGA/uWaqjj87qTTSVRgbn4udb9v8E3b3Ah31MYsXGWK
	Jpq2u3Kb7Ey9/YvVDqY1bY2LyiRrhtZ5+ndYhmDWeP3J4mtxck210hTblSLfS5opJLoEkphuRol
	+4rBP5qez16at5y1sA6Q/fN9HObZBqxrchk3DsHfel1ijqezwjCK/wmmx+GdtYJn+80bNl/CXun
	oohgV2+1dB0Lh0xcnALkZBr5F8FsulEoyiXyNW2pxpI+fe/D5SX1wE5ELttIBvr9wuLMOUZFKZd
	6r9Ga0jIbii+n1ECvfBPOZSy1xGYpTCWLLBXxnv0403Sg1KqkxHDPwDUG4KEfP++H2ilx+Jdf+L
	HSROPZ2ZM/i3+Igg=
X-Received: by 2002:a05:622a:5a10:b0:516:d955:ea6 with SMTP id d75a77b69052e-529a8360693mr87559471cf.14.1785160713434;
        Mon, 27 Jul 2026 06:58:33 -0700 (PDT)
X-Received: by 2002:a05:622a:5a10:b0:516:d955:ea6 with SMTP id d75a77b69052e-529a8360693mr87558791cf.14.1785160712746;
        Mon, 27 Jul 2026 06:58:32 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bdac28sm48156415f8f.16.2026.07.27.06.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:58:31 -0700 (PDT)
Date: Mon, 27 Jul 2026 16:58:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] arm64: dts: qcom: Add Kalambo SoC
Message-ID: <j2um5hoha5js7aatspkhuyt7luh4tecvziralqi2hyyvuqua7e@k5uq33cb4l62>
References: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
 <20260727-b4-kalambo-crd-v3-2-25280faceece@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-b4-kalambo-crd-v3-2-25280faceece@oss.qualcomm.com>
X-Proofpoint-GUID: i6qLfa4Np4FEFjLnlVelvAO9Xb0gX1kB
X-Proofpoint-ORIG-GUID: i6qLfa4Np4FEFjLnlVelvAO9Xb0gX1kB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfXxdQt0QBFXOr3
 J38++2T7Gohf+Mcz03M0fmRXsyygZKrZjBsVyc2ql7sh/HjS/YNoDwYlZ+oWaN67zFI+W+4Xo3x
 YuSd7u9mBK+Uq8618i1uLzFPHS5JcQU=
X-Authority-Analysis: v=2.4 cv=PeHPQChd c=1 sm=1 tr=0 ts=6a67640a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=EpawiZA4NEOSy88HQ8IA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfX4iSCI4CSz/u3
 EvS8q2Sncq1QqS087nXw7wsVob1/h0xVUEgDZqOwgHxk6DLTqmD3UFpnrV+4mU/oTyTwtLcMDJO
 dKfukflOPG8S4zpgt3aW0nBkq/AB8dJCjk6kX8cG/We6P/XD5tRb4QMmsPJUw0VNesm+8nSkgUJ
 k651pu8kZ+EMDEoFY0zHnYHBwdC44NPdh3toTUpUaHkEREzeVca7ZpSQHSRbT9y2q9gWDeukJnA
 SAYA13c3damcFjtL22hIRO+g9fegKzxg+lvj6pbLSWNT9PLoBn6IIp665gHymwWI0y9/VX/iVQD
 ZwcZskerNiWTKA1EmOEm1bSESw107pb8Xv4i/NuofmIgXdHfbeCxZl1undzzr8sGD0IPK5wdUjH
 rDMdcrIfIseByZifg2Wk+zZb4shgDms26LVdk3jwHzbzfmjgBQNKNEFc33PLTC6dFERrC9qNR45
 2INjV6yOxe3NAETIfVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270133

On 26-07-27 05:51:39, Gopikrishna Garmidi wrote:
> Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
> with CPU cluster 0 removed, leaving it with just cluster 1 (cpu6-cpu11).
> 
> The surviving cluster is re-added to the cpu-map as cluster0, since the
> kernel stops scanning at the first missing clusterN index. cpu6-cpu11
> are reassigned to SCMI performance domain 0, as domain 1 is no longer
> present.
> 
> Kalambo uses PDP1 whose tx shmem (lpri1) sits at offset 0x200 within
> imem, vs 0x180 on Glymur (PDP0). This pushes the tx region end to
> 0x380, requiring an imem size override. The rx shmem (lpri0) stays at
> offset 0x0. The PDP mailbox addresses are overridden to match the
> Kalambo SCP firmware.
> 
> Add labels to the cpus and cpu-map nodes in Glymur to allow derived
> SoCs to delete and redefine the cpu-map entirely.
> 
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
