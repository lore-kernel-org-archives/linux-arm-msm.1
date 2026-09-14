Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4880C33A9D1
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355748; cv=none; b=WHNtGp3KmRlV7pWFg1A243bzg0LD56LyeQb9dAxp589YkC1xCNcndKiKPpbeQGqHc6v2tem0VVccd5yTEZUlwA6JGvrgRxOFKZbLznvO5D/4sVj7VxOcn8grKoT4kVUH5bpgqZo0iIEZFqsPv3z+mIiRbHY3mtDBGpUxjBOASBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355748; c=relaxed/simple;
	bh=mK06GAMN+hILvZvtuvnK53IOVlNURJ9vQy+3bYDxhM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBATPEqd5bfirgnQ1RVBkPPbP694kCw8WuetV92KEJ/itwZM4VlJRHSevpEn+estOin+eNu7iK5I5cREnE4pqwiu9qIHS/nkgtgROdvLFIHlCtHSMo2KurfgIv917UAgzpBKKcjE8hQHiLXqjt9YmvF0iSUCVEEzyOFsnii8Pgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oPVogkjh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LY9MgJoX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oPVogkjh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LY9MgJoX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2eZfM4040696
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6rzyQuCnw85ip+ebepgEtspZ
	yo8ym6Nb1+G0cVglh/4=; b=oPVogkjhJTIyXa14RLJbOstt326ApMDY9vbgzaEN
	lKWCiddNqBpw3ZO3r7h/TyKtL2lOevEtqN5jmgqzsGCVpbYRM8VueIIZJdpmfj41
	9nnA9iYpXCLmw5kDr5/89D22D5ODkVgmY2WCylccu8TCIEcp2D6/j5EzH3NfuviZ
	lgXXl0Q8NmcJhV2Zxsp5S/WgmfI1eCgrCsA/VMupTP7wamObl4eVuhYQtu65cjN6
	FmgYGfTLrHMgdLWYHcAaeng5k85PzPx6MCwUAZVQ6EzQ6alxJw3U1uPBSLzhbjRq
	/dm5wmQ9eRq9x0zAfltk23WPKaB/7FRPyuSFcAS04o7J+w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dmtpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:15:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-399311947f6so5411912a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 20:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789355740; x=1789960540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6rzyQuCnw85ip+ebepgEtspZyo8ym6Nb1+G0cVglh/4=;
        b=LY9MgJoX+Q6KiUbJCbwqp/NaMyqz2JzY6Lsyhduq41ISdCvi9Q5TgiZTHXQiu1bmPJ
         gOdENZIraymCZuPswx7MA/Z5s37lfKqTQz7t7GX8+Cl5CuaErzDtGRPItuStuOF6H9K2
         f46w6hZlcqndI8VMlZ9ONE1gMDztkCghy97Xcv2sVA95uhLcZ0HGZecbE0MtFAsJB+on
         AiZEt2/Ec62FPs6DV6VpfDYHGxV1q/dXc6cKVS6GgS35qs0k8gSalEE4iRUpG+mo0zhA
         YMrMiRajfvvXyVT+0c8S+HYvXlHkU5IlMTtNSkbtpsdFJ/UZNrY5Px/V9wZv9W5jatsu
         NB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355740; x=1789960540;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6rzyQuCnw85ip+ebepgEtspZyo8ym6Nb1+G0cVglh/4=;
        b=jzOjDT+22TLAtp1nZBnS/q8P8vxCz03gaPItF8NkChXcwnWtj8C6L64/gOzg0OqPbg
         GfEkcwdllO9CHrj03UIyMjxTiBMF4FENtPSgtvF0jrhOLDKtMAjlNggx0+q+uNANpx40
         i0I1CIVg5sl9ndQOE9bxiZD62qxoSfazHw1CcnhSSqcUcex1/84IK1pThdEODvOXKli6
         GPSBZckUsYfvfEGpietwNDIyFplWU74DJqB45bSOKOyWjrcjrXm+X3ctlPR1zAQuLsMt
         eqQvjdZ8D+p6wx9pX0xEV6OBLXUFijXkSsBuVBtB10iofQD5zcHHMQP7ndUxvC2S8ANk
         YhDg==
X-Forwarded-Encrypted: i=1; AKwUvBxPtmlXt9yGOUAOR882ayLyyVWBKMMkuzpvu6UnNHem48yxDG5Foxd5JDKaGYLGAQXJESr/60Sz6fdeXpuW@vger.kernel.org
X-Gm-Message-State: AFuF++kZtK6s3pHL93PqkFyGQUeCq9044KeQMQS+rDb1/diIgLMq7dOP
	psXQORh/64t9qrXWHFTdzz7fItdx0wbybAanGqLEatAkgB34MAmNKwdjBF7Zs6jGnG/ek2hYBNs
	bhhxHwRdwg7TljXmNE6vsCA8ZmEQpEd5KS0ltbM3iY6Ov+gWf3xSHVn25e8JGEtQlmL7i
X-Gm-Gg: AYBFou2gDsd0RuoOl5JEe/FyiOqy47MAEJ+tNJVn3hL9bHcDMme+t8+8FYfYOTAVsoW
	N4hU7eGE5cDSBfsYy3VK/xcdp5hcWtMstXl6KUi6tVxu8P+hehm23x3Pxrsuz9+kzZQ5UAkleAI
	QhB/HNoiyYekwLCOS+SDvsoyP8HzkokxqHDTtU7UV3svKUnQbMewxdUfoMvpBM4wsaYUcE0WvC9
	EJvAOFVQTqnMEEtNep4ybGYWxhNjB5qlBU3VrvsQY+NJeUGWYQ062eVUn2ipaWtkwJkkykYnIFn
	gt3jzpX5jY1p2TOSCa3kJbBUjuGTBRj8RssxSb6Lu0BhEtiOqFZKp+LEB5zvep6ebf50tfH9PPj
	auxyo2AGF+WGbklLHEVoSkbrLeLqR2lhgv+qLFAhDUgs=
X-Received: by 2002:a17:90b:1f86:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39dec0f9ff3mr1737751a91.24.1789355740010;
        Sun, 13 Sep 2026 20:15:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1f86:b0:398:bee5:61d6 with SMTP id 98e67ed59e1d1-39dec0f9ff3mr1737689a91.24.1789355739511;
        Sun, 13 Sep 2026 20:15:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ee07f2sm21136098eec.18.2026.09.13.20.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:15:39 -0700 (PDT)
Date: Mon, 14 Sep 2026 11:15:33 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: nord-embedded: Fix i2c9/i2c10 pin
 functions
Message-ID: <aqdm1VO1IWs_n04v@QCOM-aGQu4IUr3Y>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-2-shengchao.guo@oss.qualcomm.com>
 <zsohlfgrvaqxg2wsymmgeiiasstmk3y5t6vj3aj3v6gl6arcqf@dwyie4ondge7>
 <aqdY43X_kskpsjYV@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqdY43X_kskpsjYV@QCOM-aGQu4IUr3Y>
X-Proofpoint-GUID: DR7JlBxV-gzeT8c42Nw6zwvapcI4H1G1
X-Proofpoint-ORIG-GUID: DR7JlBxV-gzeT8c42Nw6zwvapcI4H1G1
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa766dd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kt1rYbH7FQegcMq7uf4A:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA0MyBTYWx0ZWRfX2X0WTlNdhJ17
 bPzRk5BhqM+ClNYFVrrZi6t2XFa+6UHo72cQn+NWKx2S/Mc7ys9vaJir61hoGnrV0cVF5/fDWaR
 RUkMfLJTnH19TaiA/en3UIDobn059cY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA0MyBTYWx0ZWRfX8qdfn1lO5ecF
 7V6krJIH3dSEv6GLVOzUq45NeGSMNNnF183h258hX/n1ZfoUQsTD3kl/R4rimm2cT3CT6POyWL2
 Qh88jOshmp7DlyGLCE2Jv18tgGXkdnALUf7IUUBqwVEZfvq/M7Bep+McldD3/bG8QsOFcL4eNIT
 XqvC5IGuzVr9a3EBwCMNGxm5jVV0GAQ901uXXSgdgo8nmD0KCVu9Pb5uvnEJChCOmexbAUnfzeJ
 moZ+sRMzBy22+ufj962Kk3DOZwHiGj/fqXyp86OBCOfUM3Z8wa95qA7x0eRAsJ6Y8e1gFP/oxfG
 FLkmcSZNoP1k+jW6kpLt6GXLsY8V1ZKEE/Wyaj1+ecxuYruOa9oJIQenJsHIBINZl6fnjJD4vyi
 5nh44lU6Bn9J2yWsZyIPiGz4zBVl7WjtoILAc4KEfNwxryDeOOQkHZMyeJ9RL3OGlc7TtrCkdU7
 we/j/yhh/lJ1TbwFNpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140043

On Mon, Sep 14, 2026 at 10:16:03AM +0800, Shawn Guo wrote:
> On Sat, Sep 12, 2026 at 06:34:14PM +0300, Abel Vesa wrote:
> > On 26-09-11 22:20:36, Shawn Guo wrote:
> > > The i2c9/i2c10 and uart9/uart10 pinctrl states shared the same pins and
> > > the same "qup1_se2"/"qup1_se3" function name, so the I2C states were
> > > indistinguishable from the UART ones and ended up muxing the UART lanes.
> > > i2c9 and i2c10 therefore did not work.
> > > 
> > > Now that the TLMM driver names each lane pair separately, select the
> > > lane 0/1 function for I2C and the lane 2/3 function for UART.
> > > 
> > > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > 
> > No fixes tag?
> 
> The Nord DTS hasn't been picked up. If it's preferable, I can send v15
> of Nord DTS to fold this fix.

Nord DTS v15 is out with this fix.

Shawn
