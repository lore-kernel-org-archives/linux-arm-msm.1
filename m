Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A189B470E85
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394215; cv=none; b=dBgK2NkkLUShrx0wSlGMBzi9kSke21R5E9WQWpBkWMKItCqkevNACk9svXuqGWJ2gf+INVVeyTiolDIJPBmjG5VPTFWX5vpmpTxdjQNI2uybHn1cyxn+QJ9fIXoR5LpatNn8DjVYbDiR8i7zC6w6zLimrg8aFJK4pkjiWg2lOUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394215; c=relaxed/simple;
	bh=M+6skgex2LbjIffcqUB493F4H69t33R9/Nvqv1Ylk1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MohQXOERw61xwsRQHlP43hc8xAbnuSs/R3V62MNuhbT7Ui9+UPcdZcS/qY0w8OtKeXGNqzl9BmI3Y0GvZ7LnF5a5hy4mvGkO091KWn+SSO6qjcHm9AB2fecUzAy6RwB1YplyK8kxJD+Ai8JsMkgE3Rep7MEtEFZ7/jQ6J1fZ/bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMV/ZtK3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRjBlqhS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hMV/ZtK3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRjBlqhS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Q871761277
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yQZu//0K1s9pcLymof9rDsgR
	75pGuXjqO8YGkCYwTZE=; b=hMV/ZtK3+GXgbYpoksDHzpZSkIsTOaqBgOmBbUzi
	0LSxipFA+Eoo+Pdwx+o1SbgPTx06vSoQDVFAJWamlLrBw+uwNVh75jwX1sRlWS/e
	uK8l2sEy3QhFcg56tJEfx0MGDVtFLZxL/8jfcETogCVm8ADj+1Vvs3ksW3gyim6S
	0IFemGHV+e+aF7+Q/1epZDeiebsM3igtat+K9V3AU2rOG8rjLLDdZ5ooft7q8pW4
	nu0gbnVz8PmkzAwDZnUDTufBQPZlVaWexPSmZEt+x1/26Gd7rDZIV12jSfGQGkg0
	Zj2ZfdJHyOkWEiMcc1+hNqanxWGoY9IVt91ETgnK7NOUCQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8ys3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 13:56:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93918756165so617185485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 06:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789394212; x=1789999012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yQZu//0K1s9pcLymof9rDsgR75pGuXjqO8YGkCYwTZE=;
        b=hRjBlqhSF9TeN6Wm/MpUM/N/DNXiPPLyEqPx/+P/3WDswDHBJnM6Gh0FMRnLv4cd9i
         cet4VMyxeyPHHrFqeBbnV+BNGc4Nn1IqcGb5GFnWN2aiOVjfGMx/VYZEOmAdYd2Q7UNQ
         tJLimNMnS61VeZpgDTkg4la8n2zgm2+fzbBaqXlx30pccxTWEDkT4/Nvt6HTb8/cj69X
         EJXOfxtCEJOwI4PVTK5wBjmV2bMAQDA+A0kj1oW54VXENAvqdLK2hm2+FRs/az9++MIF
         Bzy6Wo1+ZAqkNWYpTwhgInIFnLUwmUgufffg7lC3es2AJdrOtKFEacXB0YVNzTPjOhfR
         JvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394212; x=1789999012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQZu//0K1s9pcLymof9rDsgR75pGuXjqO8YGkCYwTZE=;
        b=i+LKb2BUB8YwhWfvtFaZ2b+SujZPBgebgN2zF9b4eF0LA4WNCFZ7oZTOVfdaycbLNZ
         v7oic6InMuDYxJTvH+7geYKPSa3xhDI8IpZiSRhD2a5xGrNEDQTGqOF1ejRhQrmEQSfj
         dN9iJVTwc5bXhFJVcgfgvwek/0ooDVky4G+5LXMG260Lgs9M82cSzQLEBOKWELcP1xgq
         xswVthj5FpSj4SlurLtVOE0il/is/tXhdDGOeWj3oNF05FlHdmFJp+QaiSuQcBRQLKo4
         GCnx+F6OeFCUrfIzaG0PGygBth34FghVYT0Ec0u/GqImsU+kfG3GqqoNdnRcFXq27m1h
         wxIA==
X-Forwarded-Encrypted: i=1; AKwUvBwh2d0kNfv/90Ba90b3KP3/CQTzOJjzhQLQVE5nt3ZThRyxk0URUIcumqzXKS/TPhKAOBNG73TL7JoV71We@vger.kernel.org
X-Gm-Message-State: AFuF++kZgc4h5M5dflX1U1vB95/V7AgfGpo1j5ioxRBjJPLTzu+0ufE/
	ySP63uxt3Sp9gt9BTq/QzVHGMwvs9vFxLScZJYjgG4/0eEw8AiLVQSIaoBcO73FR3gFxw15lzJA
	bJbnqfmj+XHmbaXnl8yK1pOUd0BfrWt7KaVhY3GH8Z9kns4rnp/hIrtNto8Bj9CfpW4kz
X-Gm-Gg: AYBFou2L0JGkzBdqtG2lKVzldD0YjBB2dpujGuFpvlXMHvQwKJmY0iR7vQOSwKC6ElO
	EOMMd7lMxwTO/5g1YKQBGw4nSwka+4LqHRzAp2WA/Dv/CBDKXKl63auhsWz2phUTT2uwHa6KALg
	pJvyTVITB/lEsrx1cBNMc6HJcrpHGxtqAWutp4kB7KBHzxvzchPSMRpPCweZGv0b8cdXGo/+jm0
	CsaOXGVPGSoVbhqVXJxpTh/TAsaxCLmBkJyRjcDtlIQ7JGo+BIL/Ox09m3glZLJW5XsfDoRnQg6
	pqke3NMHJhEQXQPu7nwzai09+mwwAzWWE4m61MJY8jqB2DZaDkcPydSv1vvoWJ8y7wUb5vVbgMh
	EZlplZPRM2sZXdw==
X-Received: by 2002:a05:620a:4089:b0:939:6de6:9516 with SMTP id af79cd13be357-93a29a5a848mr332587285a.45.1789394211635;
        Mon, 14 Sep 2026 06:56:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4089:b0:939:6de6:9516 with SMTP id af79cd13be357-93a29a5a848mr332581185a.45.1789394210989;
        Mon, 14 Sep 2026 06:56:50 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm479951375e9.14.2026.09.14.06.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:56:50 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:56:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Correct inconsistent indentation
Message-ID: <czb5ip5ndan7dbp2psu6mzycyv3rrk2sq5ngc7czdpen2czchz@odfmpqm2hhij>
References: <20260913141440.177169-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913141440.177169-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5OSBTYWx0ZWRfXzobdZ8EhH9A7
 Fx73rHdU1iv5WgPovkK+QODU3b6incA3U7ka1SFffIj7QQKg2vHiPCk7r6PUlWLKFbejZClzbGr
 p/E7KHZzYSF719Zar4aixb8ynlYaWQ/GGA/8zA8W7QTjdEcQIMJe/R1MPXywkgcM6/Smup5io0f
 8zkSDuCvYf46qrTGtv17VsZDcaIJSTW6C+du3jUs2r8ZRmwIIrrAQcz6Op9skWe3UQ8+ofcLk+P
 VDj1sG14VKSQbf+VAD3gKtKbUPO3qF+vNtH2yDkWsBj1wfLIPKwtFQQsOThGyaQbANDyhKOZl+s
 oWT10LKbbcVBiRsoiI5pBSUmLG97tOkuOHLEnlaCDUGI8PujBsGZD93xRjkzsbgzZm8O6vlNTq1
 qWD7QTSIVwpvtgL2g8TYtvMbdrBFaLE1bgIFuRrVaBkFWbGP9c02zGj/eDi15daiLHBo5vB5fvC
 uiMPuFzox9di8i0oYNg==
X-Proofpoint-GUID: o5JuHU2aauIPxME6qQuoAjlSWC3UfzLA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5OSBTYWx0ZWRfXwX6CmIcP5pYr
 bfyYZIAPgrDN5v56bZs7GQKRmkaI5fgbXgDFvpvHne/OfQDxdaevsmLhewsvxyozSDlIlLohfBo
 mAB0w8++Fo0UAeB1yiNbCShgdj9rIQA=
X-Proofpoint-ORIG-GUID: o5JuHU2aauIPxME6qQuoAjlSWC3UfzLA
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7fd24 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tPLuR_csD6jfBswSsDEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140199

On 26-09-13 16:14:41, Krzysztof Kozlowski wrote:
> Fixup mis-indentation, e.g. spaces or tabs mixed with spaces, to fix
> dt-check-style warnings like:
> 
>   talos-evk.dts:39: [indent-consistent] indent mismatch (expected depth 4 * '\t')
> 
> No functional change.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
