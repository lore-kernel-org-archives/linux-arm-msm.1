Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461679;
	b=uhQ2shs4490HP76OMBbHlbUNl6ulI1gEGwXrOlA03D5AqkrfbIAxjKDq50CxUFtrm8AU
	 xaR0BAJ0+Oi+LaPzSLkenR1YS5xQAk6u+5Ysj/ffyDqg1/12/SZZiRdS00ybibJ6o5rqu
	 myndgdnzaYqWIVDjEoQG8ZoyEe5QUnq+TpXPDgXWKnHxxX0hbH1o06iJubpcc2d1cCKi2
	 PBk9za1jq9neJoxndI9/i4jrJnjS064In2jg3XqZGP+nmrjZ2gE7iMDzLTZM+PPpVjzNc
	 Z+eUWxZykNzpiWfTNLqK3CtbvyM28WQmgaocqedS/lwdj94rKnzLUTCkKW0hF6Cc0eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461679;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YenVzUENeyAkfY+Ukcti9f5MSKqLTG55sZyF8s5Xbrw=;
	b=rGI/dPBuhbg7eZo3uCtIcOYa61VXraNOxhdn8M6UrI3KrlVO5a8TYC6D+Oe/GcY8z486
	 uefmLRxPcYkn+H6PbX1DrGk/94WYqJEK400uoucIb3cOlX72cHAuZhJblHpdZwFTaiV/1
	 c/iaVQSzvDDNxyMGpZVC2GmmACMA2w494I6Ntw+fnQV+32k8Q4mEjvftkoS3JU7WL7lmP
	 mywVCg7IHPh5LvLbmSfwS4/frqIVTMbxp35JoANAnjrOP8qVqNtX26AIz7WmoZ85F3eD1
	 B9cBjr93Mc5JkkM4Kd2P45XPBYkWt2vaMAeMlpG6cxO3THh1Idq0fZZfedgP5/BVlmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JKFMA2Ns;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eFSQeXN4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C633D606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C633D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JKFMA2Ns;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eFSQeXN4
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGmqp3025333
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YenVzUENeyAkfY+Ukcti9f5M
	SKqLTG55sZyF8s5Xbrw=; b=JKFMA2NsBIRsXVn++Wc/mZ/AIOPqgZO3jSdYvAIA
	25w8PSC6iBkjYpz77hpafuNsdduwQKxFTRRT5CROSY9WvxGBunoTAuKzaFeqyUK4
	Gl3b14Umc9qWeHHOj6075ehq4Zu6T6VeYKSYs8SgEr7EtA4M3cRu9d1HMX3IO5Fd
	R4sdQ85YOvkbLTSLZURSBBSuzK81Et+7YjaqL23xsGuyaYfDO1m86ccrAHxdNYc9
	kKwXARFdlfCAytmv3ewuxi9c1QhsDCMpiTjWXPGXPVMi3zh5R1HzN9K+WshPzI/R
	y4D5B8EmGmxdVEmbAXiZ2wuI8z5Ye6o2bSHEFk3QL7rowQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pb3ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:21:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so889219885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461677; x=1796066477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YenVzUENeyAkfY+Ukcti9f5MSKqLTG55sZyF8s5Xbrw=;
        b=eFSQeXN4giAiqbv1hEDTfGd+xXbcZlESBdeRlQAIwDMqrWOEX54/jrj1FWrS/+et2R
         hy1WdEKGp0oMdX7FR6tM1Bxt9hyL7uYGjR5i2NiEQMe8IBK9Iah0lRDZFJR0Ei78XdXM
         +fmVVhsYR05MvLSwO42Uh6y+43aCzXW50vudH59hVjmQWgkPpjYO4pymtXWczigWoGse
         oXU8a7zyXB1EkUflA5OyGtZ3gXBHow+sR3s+oG/jtNEY5Mznld8SSeEHdGf7G/8pZiFd
         7f53iqvW8o4btCMboQIR9ToTuabPaWLURinYd6ihi8uP/1KiFgjPRBnQJgsrQkalvh7O
         /KoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461677; x=1796066477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YenVzUENeyAkfY+Ukcti9f5MSKqLTG55sZyF8s5Xbrw=;
        b=SAgt1dHmpH/i+eLyT+/Q6wiXkXkcHL5jVYbStNH6zSEfaI5CgNZ7xzaAWyEj6Roh4Z
         EmZth+OK/M2Pj2hwoNB1EijegaYerLEZOTMUjZrP5HlLca343ntxcaZAzg/sJB8gU3Ub
         oM/kTJW06Q+LoD9Z6T+AQBpSZRkR78CnmP1j6fx1nG7yA8jIqc6i6ds28YvPgh/Bn7yM
         ZXY5jZ1mI6WoESOG3W02UpmT5e5Ofoc0rag/tlYV3vFBxn4r7fCLazVGeUElXB1NIn+W
         FGytPelLpzPbWbVe/+632HtpgoayUQiO4v8w1qXXlNeHrAlTMOu5CYIy+aH3UqU39u+m
         A4tw==
X-Forwarded-Encrypted: i=1; AL+hErF+dma/OygmOmQ9/lNVM/oHmooOoyD8TY+nrr5pKqiuNMiU08ss8dvbpWwRTqEGyCR/YWnyeyFce6Qv5XVE@vger.kernel.org
X-Gm-Message-State: APuU4Z+5JGh/S/chTs/AqjsBxCABcyvIuZL6BoxNvKl5DhCJLDBq2Lj/
	dSgV6E9ois6dMC7cmOQyR4gNUxiVMndHlObP0C8TIPGHSXARYcaysjkI/VduOJH1b9/OyRXIJKZ
	dsTwPWPDyxWRGVgqX8KSemMJ45DM/Te+9bJUSzn1xS7CMzBj3YY7zlx5a2YMOa5GJXVN0
X-Gm-Gg: AZFdTZdV8mAB4YWLPU0e156ahdBSNi5cug2aQlAxjsJ+XC0Os1TF/WRehu5ROFtdU1p
	judDyi8kpKKmV6GWoT9cIAzGRZHhYZqRFDRPmIDskzGi1SCcrFkOJDb70+cST17NLv0Ucz5fkUb
	moHKZZoCo6ObLuk0M31Hn/dp7dP55twOtQGBFbAoRX2/31s+k3yyYuewGTLcgZFCkKjDe3G1qDL
	eA0kQEpQ1wfFzORPsba38Y5zhJ47ZuTxUx37ny9GUocCNnRJlTEY5CaBnU+3TcSB7uSWC7ZEwT5
	sW23w0m/BlLEUkBR2839W9fzfJaPVMa5WfVozS25mVqJjdWg1Gf1PstbVfamGfE9QPz205f7enN
	WLzHB9gtUFlzlflQDzzXwIp/Usgr9535UAXNmTtUo3ONM8BniLcpXt0EhkrPg9hdF
X-Received: by 2002:a05:620a:1d0c:b0:93f:26f6:6bab with SMTP id af79cd13be357-949ba99b09dmr1953017185a.18.1795461676785;
        Mon, 23 Nov 2026 11:21:16 -0800 (PST)
X-Received: by 2002:a05:620a:1d0c:b0:93f:26f6:6bab with SMTP id af79cd13be357-949ba99b09dmr1953011285a.18.1795461676029;
        Mon, 23 Nov 2026 11:21:16 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm23371864f8f.36.2026.11.23.11.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:21:15 -0800 (PST)
Date: Mon, 23 Nov 2026 21:21:14 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/4] clk: qcom: Consistently enable MSM8939, MDM9615,
 SAR2130P and SDX65
Message-ID: <4zmv32wcrtblitogslaxlr7cc4u3hmhovckbce3o7pbjm72i4d@z2aelpj2wihm>
References: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
 <20261123-qcom-kconfig-unify-v2-2-fe56c8fd15bf@oss.qualcomm.com>
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
In-Reply-To: <20261123-qcom-kconfig-unify-v2-2-fe56c8fd15bf@oss.qualcomm.com>
X-Proofpoint-GUID: Pmxo7j1I30baCBii3-7a30Z7VASSGVBE
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b04922e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7p0CJgGdnewSgPJmmb8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX0EOc4DzTvTkQ
 QDG7YtFlp5p+a0CvM8/hE1eAYK9Xj+jXj186ifx4UjtApJ0ZVt8MAhi/QPXjyx6Akt8RZcQ+xCV
 Ah8+iQT4849JMm1ktYCdUMWhVf4vFG0=
X-Proofpoint-ORIG-GUID: Pmxo7j1I30baCBii3-7a30Z7VASSGVBE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfXwRnkOW72E+x8
 cl3cR6pVDcRJLknlx6/pY6y1NFCrPGyCBjaEqILlkjbp684uTfB5a+Ast0R/DoWf1P7QfTJFlj5
 uwz6ZwB2CzFNoO13TffvIWPrCG7DA/BepxflzgbU63lrtSmWx3U9uGyxlKOdxizBt9s1HVCLV7j
 XvO3M61u2grqgM1/Fe1yvkRP7NDhkMhgH2URyfSNOPlvfH47/e4PafMIG36qhIPebUsDyYRfIgv
 1JE+C0t9B2/81yRzS8X7vufxb5ebO1k/xyP/VBOyPZPdd5GNpUzQviCazOaDK+Ut0O+E40Iakgy
 VXVbJZG1ksL2h7w37hKoaW0ScefIF1QY7yokjsOW+VJ9oot7/XBoaIQx9Fu7iX/ckH6iKYbszSP
 RlihS2UPAS7Pd78fltlojObVUrNnHrxA4o5IzOcfZDLJ7h4A/CNUwJh94pyyiVXnZyI5hdJUfPB
 FLsWhnU+j4yWjmN/peQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230077

On 26-11-23 08:38:12, Krzysztof Kozlowski wrote:
> Critical drivers for MSM8939, MDM9615, SAR2130P and SDX65, like pin
> controller and interconnect, are already enabled by default, so should
> be the clock controller drivers as well.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
