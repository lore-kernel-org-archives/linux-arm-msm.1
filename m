Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626654CCDD3
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406006; cv=none; b=ftju08EjQMJz5FPmQGu8FhJL4NcCJ0TRufNCzRTGV2Md6rGzgTamcaMrg0ssp+rkWpsuDCekTNnCLNqVKJUtxKMfsRSs4wp8rZ7HGbeMED2h8F+J9UeaCH7B46jfpIrPNYvyk40QnO6WtP6UEK3qawg5/tZkyTyayp3oRkkmVJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406006; c=relaxed/simple;
	bh=Qzb3HHEtxPgHJGqlijd2TCpD+/VFd/BWXBo9naFVqAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTlTZtZUFBWEU5z+uFcoZl6nGICuYH3gIUXLNa+B7JdqZI92U853ggYMGOnNzHLlBhFXNjDdzySiNciBxNccLpxShXHaskhBtSkKMX3nTZ4XVlw+nrMsGVQWDUn8OqmJSBhzHqmBUE+j3iLSFxJjJqFokCb+RGQ02+pLD+RY1ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nOgTJjEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1cIzuFc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nOgTJjEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C1cIzuFc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P5cl1896537
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uYJLay0WDfuP6LrjHm7Y5hKU
	02X1f9DjWzZc3tzDB44=; b=nOgTJjEmKAIJ/toFGoThy2BnuvhlsCchi2Zc/cPp
	26vbNcZ0q+nbwCJu9aJpPs2WrIIWE31MqbiZKgrmJfKSrVjeraDu67VZhXDmcO8F
	gxPsHa7hE4G8lj38Sn4cgfi/zhkVcO7/TeUAOnPaSJAmky96Gh1K+2gxt2NeB8Nv
	UWLbXuCSW3xFz3U8rnneK4JstKIJM6iKekp7z1JIoD1Ilaa3WvPWmdafnbib9dLv
	Fvd3setCOLLxTcQ/f6QixCkdnqYB/nkpDKOgAtIPWuSICKG2TvP0B0wLrNdBgPNQ
	w9P5FyUTB7QlcYGMWod9ExUZrblO2nkJkwclMFKspofzzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr9eew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:33:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c5ab5c136so329253085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 03:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792406003; x=1793010803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uYJLay0WDfuP6LrjHm7Y5hKU02X1f9DjWzZc3tzDB44=;
        b=C1cIzuFcifjA4PxFWzinpfivujRE9mb/sraIa7R9rzC5YBlqXNdPlmosjYd3sz4Rzw
         vQZEX+7mPIb1EO+ZUiLKhsgB2yoG6lZIRhAuOL7zPs9YNXi4qWp9a1wFRQRi4FPGKgoz
         XS+RWzSZEU4PGi6hCxvDiIq9fx9t2ZgP3rAdpFF196+R+RPTuYVDCDlOwvkbW0z2/fcW
         VKp7OnVsm8CvC6py2vrqon3q68IXnISLGaiKXKawDEbOoMwmWhZb3UgEdMGc33YJbarO
         fnUnHYK1YTbGR15+PSoZdf7h0zlIWc7l2hDKDHspq9GZ4MDBhaAwRN/RAYQGj3sxvjtm
         A6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792406003; x=1793010803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uYJLay0WDfuP6LrjHm7Y5hKU02X1f9DjWzZc3tzDB44=;
        b=cPyiDYqE5bWkS3sEow6qcRRuT+Uyx39paBL6Ci7b0f8bK/lWtRm9v1Lxnt9zKgHHsq
         XN0vTmOuFqk6t0467meycJcoW467gwYE2n02ozoC6FELjd2sjvyyhrAH6l77kUTIj6vE
         iMl2kIExrTuxpzKbbT0h2M8zNuQc7DQsAkEjMM+wn1WArxMwkw2tZBcBU6rGro+pHP4Y
         CUG02k2ZyqhQ523pjk4JK0dnFBVoj7twS/0TKswp/6J0UIpunibsNagNahUjG8UEuh1b
         CcVl9NDUfrs59sXuIGVjzFS0kEBvbPGY2gM94zFbf45D3r1mtKKDFDa2pYSXFHT0LL1g
         Qd9w==
X-Forwarded-Encrypted: i=1; AKwUvByJVQB/pMxcwZ2GaGCQTPK1MYTijNkYAUGz3p2ZE4I/h9SJWzCFDkFsPG7QpmNM33oJlHfLBHmqNCr9n6L9@vger.kernel.org
X-Gm-Message-State: AFq9FYIhbjOt0SblrfEm/1LtOgg6nswIZuZWuZ64pnE5ULu1MV8tWl1M
	a3Fj9k+mxXY0zJfYAYJZqlCbT41WYzUZoAvG3P5JauOkscC71Yh8gN6SoeOxn+PNZP0vZn7cRoI
	o9Cb78l0fL9BKTNHbWOuxvlse5U5XvCO17ZnbOyzyyVbsjt0BniII1Myg4L9Fn9Lyfsp8
X-Gm-Gg: AYBFou2dNKEtH0BKuhWKZ71WBpkQXu2f7DMLdxDdN/pb6tDMx+HqVtAwPhvZjHovlh5
	3k3jKnuzi9Tv8/P6LQ1TzvbqyU0zhHVn3k5t7684ypSwea0S3PyiLmtdI+ce6N/BfsLMaf3WJgp
	7N6qPd7MFKqxaH9MpGYTNggt3EXHxybZ3U7iDKUkHqs4FUDDipUp4My6l5AGmWp3Lp/aJDj/Wsp
	L2E3+1hu8NTuT1IGGH5xkZblzBjPNemypxR/sR14AbOcI8ROkM2InGm7Z07WHME/qdN6RmgAnnf
	Q+S2ny7kby5IghoWhhsSAGyTGk39OsknThD2iDVS2USxn2WLoDsf894dluhYRKANiRbwn9FauAi
	zqgP4quIeue2HgHsd
X-Received: by 2002:a05:620a:468f:b0:93f:242c:f4e3 with SMTP id af79cd13be357-93f29d2cea2mr1163420285a.32.1792406002632;
        Mon, 19 Oct 2026 03:33:22 -0700 (PDT)
X-Received: by 2002:a05:620a:468f:b0:93f:242c:f4e3 with SMTP id af79cd13be357-93f29d2cea2mr1163414985a.32.1792406001910;
        Mon, 19 Oct 2026 03:33:21 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5038b8sm22852542f8f.48.2026.10.19.03.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:33:21 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:33:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Haipeng Lin <jimmie.lin@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1-denali: Add PWM backlight for
 LCD
Message-ID: <maiifisui7aqt4xfc3mzulavhbxmjzmvdspy3fzjbjf22fgmir@durcnc3kia7f>
References: <20261017-sp11-lcd-fixes-v1-0-0eb916c01a3d@gmail.com>
 <20261017-sp11-lcd-fixes-v1-2-0eb916c01a3d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017-sp11-lcd-fixes-v1-2-0eb916c01a3d@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX6hgXDoJjGCXu
 73JoJU/XYKZjaehD4avk0AaNw/zBf/47qSyQ6wf2cX46N6tW1eYW0ZrFIqypLFVEJenYRnOBAXY
 hd3d8BosHUG2wPU1OuBrCfbXeKMYJouOHZeQB34nyxcLokpbLBOaMsswaCqLe4RyFFeZtuag+OE
 3RbFHR8CprCwlTXftXKXhP5ID4PwObhGtD2E08TOT/NNeSSPk+S8Y2giz5dn5TCQ/uknCMavzFc
 tnmI5xkdXxXD+W5qvtx+2PQrEeFOdbTy0QuLEL363p0PHiunHX/1Br5+TYaDRkHyj376aXpuiNq
 hDjeK5z5oT61NvuSN98mGvDDEJwWnr0ymxh3PgvFej4MaBjsFyyYceMQ9x/HOHfn4v3LGlLE5uk
 tYdH4J+6mTW/Xp/JF7hmxtW9dN+wLI9a/dTZdXQ3W1wAxD3A7sLfwIq7A3U/tqPpouiPkr8znQ+
 DZixwmYVi23ytuclYBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX37xfrPOvuheM
 TGQqFwtC5yimdo1v6XEvqyv7exTFtte8dqzEkEH2GjLAKiL8g65ZLUWtvmPure4UPUFjT5XNYfY
 6q1WRibGhp6YMZhO3q3fadmOo/ffgUo=
X-Proofpoint-GUID: 2DCyBxQUMT2HYbT81LXW8WvBOvOg3Ins
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad5f1f3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fqw9755z8sLMpkJnvnUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 2DCyBxQUMT2HYbT81LXW8WvBOvOg3Ins
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190041

On 26-10-17 18:52:26, Dale Whinham wrote:
> The LCD variant's backlight is PWM from the PMK8550 LPG on gpio5, with
> pmc8380_3 gpio10 enabling the supply and gpio4 the backlight, as on the
> T14s LCD and Surface Laptop 7.
> 
> On OLED gpio4 is the panel enable, so move it and the panel compatible
> out of the common dtsi.
> 
> Fixes: 0d72ccaa1e84 ("arm64: dts: qcom: Add support for X1-based Surface Pro 11")
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Tested-by: Haipeng Lin <jimmie.lin@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
