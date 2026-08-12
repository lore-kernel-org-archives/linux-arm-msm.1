Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5A441DEDD
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530277; cv=none; b=sgXnXz0ce8KK0q0utdw3hI8nK7/RBewFGdlHfg2cpjMNAQ+YXivyMDCkC0yRYLiTrGYyunnDSls0Tn4Sqe7xMLp7jB/643fuXcQL8VgffLgA71QSLY/w2TGJGusCBSL1twE5DSemWGer+iHzizWykBP9EDN1N4B/loy79ZzblXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530277; c=relaxed/simple;
	bh=k2jGqk46sF1bLdy9ZIJ4CzjL14SbrH9QV5M9xpSxDfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4oZeretp752qog9vLiIqElqcsLyKyKrLVvfYx/Sd5f4E46KBfdUupqClXzcmvbFN99jqktGZkVHk94rKdb88duqRa6LPLGsUFDReghNMvxH9/RnrJh5EPDxYnOyf/aUG+qA/ZJJR+BvnMHa+eCT/1bU1HY7feZTPRlEaRXuBl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSLz45Rk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZoT542if; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nSLz45Rk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZoT542if"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9fjMA3127754
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mGD24sTGT3wBWExobgVbY/RH
	IhyIVBjaK8WNignEdN0=; b=nSLz45RkGSIJy5nhcvKdBAKmB4Stl1E8gnIrIVU3
	bEDjFAQoHPb4JXBkrefsxz6aeeXs5ARQc5tcmBJBk1nT8vhkD6r95jtOUFhx/BqW
	jYEYoGocjrSw/hk6hvVj5rnXBMGx9+YmmwGsRXQyR571aAIvwFEf0f3KlpaTy9Jb
	Q2VElLJCOSHpVGLE0e2Bk7BvhDapbfscX7ZcVbX0cbH8HRtogse2yGGNN+Bz40od
	5Hyj4nCjZhMTJmPgbeJPVCZGIFS/ULZMRgdRGOhHBEn2v6hwDr9r0UL3JbnBfSeO
	bJZ6pxiqP1XNZAGOUHajsYNrr/+ozfIgpmh1zcrBFcVJ6A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0p3d087p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:24:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c12e43b98so9122741cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 03:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786530274; x=1787135074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mGD24sTGT3wBWExobgVbY/RHIhyIVBjaK8WNignEdN0=;
        b=ZoT542ifDzKSTCKsJWtM3MjKH2LItk8qfdEyA/4zXxry1xDO6+Pzh70DcFmoqUwYy6
         234aogyQeqRunLB5beR3G2HYULUb52dEQYvii6yZX4KCdmSekbLdjaLwMAejwxYjXvrA
         iQiFO1/wXXGieF/BDOHsl6khQdu5qx7xP87bzccLLniNX6H64LLODZY1M4M/4V9ScFF2
         LUIkTOqQd4dsSc7DEGDjuEVoL/4LjSBa66eQ8nt+unVwNSrCt7y47MEmw6PsL3Cfgi8K
         exSUdraC4F7eQEDSEgp3v3XpTtpIrrqVV9guI/5/Ec2f05j9nfote/si9RkQJWL/iEbY
         Cf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530274; x=1787135074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGD24sTGT3wBWExobgVbY/RHIhyIVBjaK8WNignEdN0=;
        b=ryvko1oYUPkUxppzAmGInoIrsmWJGl1g9B0zb2v524aOrC12FSzjaPNhw/oRlWBzeR
         nR0A9U+03teS3d1VRaCP3UMLz6zptncHZSLfm46uPUetGXFceTeS0P5c8RyXw6S9cqa1
         k0oCKNoXiXRp6rQ52VswC4Wo4AHiFpadHs/VEW9YfmjNg6pcEth8CAsNirxsK49RdcER
         mi/Y2Q4lr+WTK2E3B+ieAi+53p/ttzHyjv6C+8Rm6Q9PtzNZzi/T0X8o1XPxt5VsYt2f
         kHPE2fFT3tZht033TNydkgsJhwgAmbRSAjHTDStKwlR8W+Ne2j7VChjYp5Ir9LU426pZ
         FpAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNn8CIXJNQ0pWz8TfS+8p5NC8v6o29dPLj1yeeW1W1gUjmmFRt+Q9Jx+HAHhPRNfUJMzmU2SzpUXGx9N/a@vger.kernel.org
X-Gm-Message-State: AOJu0YwqrOHLNCq14kaS4s1fj4z8uOZM0EoOxXXO/XQgF0uQXwaaRyVr
	aYPAZXq5n+wQbB6IAt1wBA5WytNbn+QrDhymbIpUysEaRRPu9LcAzRhtAf2f2CO54PyHZdXVwLU
	+z6GZsm8VsTTF7vVKBM5aG8zzY5kyNFbno0GmsRGDDwk/rNKYQhQLAckbofdNSoZy6CMLY1pI0B
	QI
X-Gm-Gg: AR+sD128Qi0NnUuXLZNzjsiUjOuvLIH8y9RRd0av40JWBJK9S6JcqRWjGGOkXI9Uzed
	j0Nntz3bvlYX/OOdEnomXEUoCD5DTI8G8DRqvGb42kJfViWDkhgauo6/OXIbiuj4MrjW6oIFRGw
	XICLmLD5MXmZe0Ymi+54oFehzdkMw8KK3aob/dNYutNzHPIvDGw63hWqpxivB06zU0amjmyVjF0
	4FjhywHcT0V5x5GQyfUvZ/LPfjCBiakomCKNanecRHnqrPOaQ9vPLp96lHi4TCwsE/Pa2BMmkaq
	O1aIQJfA/R03znkwPbyVPHN8sxP4jcio6ePqzuJeQ17cA4ZLP09VG+PvpI6YRRwCjl6rUOl60ZQ
	VypMWRkTN9XnRn7w=
X-Received: by 2002:ac8:5d41:0:b0:51f:20e1:137f with SMTP id d75a77b69052e-52d647607a6mr29058011cf.19.1786530274234;
        Wed, 12 Aug 2026 03:24:34 -0700 (PDT)
X-Received: by 2002:ac8:5d41:0:b0:51f:20e1:137f with SMTP id d75a77b69052e-52d647607a6mr29057501cf.19.1786530273692;
        Wed, 12 Aug 2026 03:24:33 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aaa5d04sm58938035e9.2.2026.08.12.03.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:24:32 -0700 (PDT)
Date: Wed, 12 Aug 2026 13:24:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref
 helper
Message-ID: <a3dfeej45s46qkicay5vsnfoe6ndnllm4llmqbcgjvw4unknpf@tcl5puha5qxi>
References: <20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com>
 <20260812-hamoa_tcsr_qref_0812-v3-2-dc7627169c6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-hamoa_tcsr_qref_0812-v3-2-dc7627169c6d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: I1oZ3Wl7WGy-4sxFrPsvZvIP6xcxCKDm
X-Proofpoint-GUID: I1oZ3Wl7WGy-4sxFrPsvZvIP6xcxCKDm
X-Authority-Analysis: v=2.4 cv=UfNhjqSN c=1 sm=1 tr=0 ts=6a7c49e2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=o07dIpAjZdj6OISZKn0kaw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=h4UwG7AoVW59HMWry4cA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4MyBTYWx0ZWRfX7aGI7I2IDmUY
 RoYQl911SY4eegjVHlzT70UcNS0gAIH345Rh12bikkTyJME+1DOP0ab0NP4RKlQCK+fKae7fyeG
 zcQ2osYeNAmz7M2siE2HpY0lTEyyCcdTLSUln3kYRFrKNZdHAfhZAEXMcjPdXZdYhuq3aVU9i8o
 AnN7oO5qtRrG1D3IoqBGDJJmSRXmUHQQJYpVv1kyfSsv9mpkK7RuVudstFayJ+SHgAyi947cUWn
 uTNBqg8e9XJx1XTrTOHeAdIW73Uc/cOraAv+3QqCuAPeBn6x9dmJrlgU1haPmJ7NCYM5utdgSVT
 TyvtOAYkwBR6WBrFml+BbGfiWMH10tFWV0/p3nhRsPpB9vhtJ7ls8C2etY1Cmmewd27gG7dCieL
 CDBCWPjY6eii+kXNQAhRrWwOWG+uB9JRyV+YAyxXcbDgabSoJYtWk0HT7JYg0xJJlpppmGVf+Th
 45Ls90tTm9CtoP5UaJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4MyBTYWx0ZWRfXw8gAj5mUNhBz
 3al4+SKaiQ5Ki5jtVxEAzMcZjxiXnj04Yw7g+/ut9osQ52QDZ3JN2GO/gMxkna4onoq7LZnoJR+
 RV2gASqtZWJbZiEF56TNzAfFb/4clRE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120083

On 26-08-12 00:27:32, Qiang Yu wrote:
> Replace local clk_branch-based clkref definitions with descriptor-based
> registration via qcom_clk_ref_probe().
> 
> This keeps the x1e80100 driver focused on clock metadata and reuses
> common runtime logic for regulator handling, enable/disable sequencing,
> and OF provider wiring.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
