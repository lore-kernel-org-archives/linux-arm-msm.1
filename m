Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530F44AA57D
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 11:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595392; cv=none; b=pRTppC5d79OFai4jGKB9VwCQ9aUXF9r/enFl4H8sNIDEA/wqnSbSu9v+JS1zGGyqkgowSzoWdjyRS3aE74cXuDeeqElYzbkNdLWJZWIxX8yisEIf8L4+L1W0OBApbVcxib8PChCqHhUKvnY/LqmHX7Oa1nPhg3gS0uNmkEqR1d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595392; c=relaxed/simple;
	bh=ehKSWvL0hxT5BEnXgdVsXrbsUARCc1Wn1UwZt+x7T8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCQXPBCh1pOEc3mXSVVxLPf37jblwcBUBXCbw5MpiQOGV+Wz0FHgiYRRXCsd7x+fSNKYoITcl+OX9IeKWRZGyqrk6y/gTWfwDvXJEhXQgrHD2tzg9WJROZiAvofOQhoFY2pV5hN62uJsBhLn1mtzhR9fB5utPMfFSAx2rnqmB/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8uy+MKQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOjTxEh1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8uy+MKQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOjTxEh1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAJ8v558162
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 11:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=46+rz0Sh2HfpjIWSfCxKOuxQ
	neQiiSNP8Sg0b+IGsVI=; b=D8uy+MKQ0+DsEdIvquSifssaWhQ9hOiEX3kYkuDM
	M9jjZsh3ZBZAM5kFZmbUf5bxyv8yFaY5M3sUxI+VYkbiMCpCk46EnN/f6xzgigP2
	fv7lg1ubUIxw+KoyHnxeFahyTD64f3g3app4f7Y2MMg7CokmHMnzy1jv/iMnQW68
	4oqvXvqLaR8+CfGHNDLowr3r/mllw47dZm795VNvnLrQcHVAHd7wyQVRApJCdaK/
	n8t7JjxG1RLcIC896SLfSDyWDiLStCynwcbSRmYOPe0RBlw5oD184+CZYQDjkdUC
	mawMb9Q+q6wVGvyIGzbl9UIWEFVZjF0AY4jSCwa86as53g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq1wvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 11:36:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a3f673221so869199185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 04:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790595388; x=1791200188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=46+rz0Sh2HfpjIWSfCxKOuxQneQiiSNP8Sg0b+IGsVI=;
        b=bOjTxEh1fMEB3vdA2idGyGg11vQjsTjaLX1uAHesl+sNCoLqw4/GFUcKL1DWMZ4W24
         b+zkjPg9Crql81iVaNGy7Fg+ZpSe4RoPOZF/N165xPo18PBqCMI8AhOGHNsHwImhc9jf
         OKa4MQOR4T1j1UnoFJo1nEhjg11PI6DOHAVj+PeIqOM01QFqmbBHUtFQ27qB1eMdwFkv
         D+CPHgIJfqhCXASbLF3IHUoQ2yqsIvOoPtWt91N8Ncd8uNJRDgyx9A3PXyUY7RerCi0p
         MlF/mGX143joWVKCP/iKLmM7z2aqzeBa1HrGJqHLMd86vYH0xKI33h8Kqm4XHCsrmKgG
         436g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790595388; x=1791200188;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46+rz0Sh2HfpjIWSfCxKOuxQneQiiSNP8Sg0b+IGsVI=;
        b=ozpXOG7Mr8pYoWVfMCNbzv8tAZ64aO28Kte4fuMnLH83AsHYsxvwl6jvCFSZ6e7WOd
         0qG/ZdivXYWGejsjqAzhkSeEQkkyePICGTMAPyToklnZVYlGLE5ZvkXIQ4hCKmhmtcQ3
         uvotszwAIBUBvcveAlRMeqz1lLIewtozlLP42HDatJDBUaFZBvnedwt+adzjCHHufLTv
         X0JUBp32DNwDoPZkWuAF1pcfCOUTyjkkbgvLQuCrBW0P6QLwAdTm2Vr4rIvQ59KW13p+
         T30rDTR8yKmAWl4pvUrr84AGxd9UXUA6v+R+C0uf89P2o0vgyFy4+3yiwJb8AURJK+bw
         F2IQ==
X-Gm-Message-State: AFuF++nEK/NbX97ta8pWKowwf53JbwpKuapSvt5GfcAUmmcNdV3p6Nl2
	mcKS7eWgS9x9fkLd7Q4/VmXJJS/gKEWjw1O9D+azJZwL8Q3JGu+fshTnMT+EA6DNTRQ4bGQoSjx
	Ax0p88GueWia10wyVTZCQ8tbdl9JF/vGzmRgWmUS00ia1cXeW1XBMwF/+PhZwR3QQB/Tv
X-Gm-Gg: AYBFou19xVGbg8RCB15/FuNzzvEAforL1S1eoS0KbhCf8XDfwnGenZno/r/2+7/3+AQ
	VUP0+y/u8ab/N65S5oo4TFh/KJCbkrLVkuHCts6yPvH3hsZPdykbdPSLEnQqaxp4HWk2PbQ99EM
	KnhaVhG+hsYT/XeSoxwqqptr4/LsRju9kTyZUK2B7q25lcelozLgtodzun/HDdWMkxCZIKdibJj
	x50HCNf5xxrJliMFeIQ4w4TWjF4UwnF0Ub/ZDxrQhXLX5w6jPauvNYcWdR3qyt33qHyCtvWn+YL
	/1bWUY+qXxD54qGjJ8RLRD8lwV3ri2KVtNeAKymCUU8RWHCZZ8NAcm2sjeehKdTBf4XBlPrbdkz
	DQJEmKaUBJqQEXIY=
X-Received: by 2002:a05:620a:4809:b0:939:6de8:43dd with SMTP id af79cd13be357-93c47511ed9mr1785437985a.49.1790595388393;
        Mon, 28 Sep 2026 04:36:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4809:b0:939:6de8:43dd with SMTP id af79cd13be357-93c47511ed9mr1785431185a.49.1790595387711;
        Mon, 28 Sep 2026 04:36:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a008f7f1c2sm43908035e9.1.2026.09.28.04.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:36:26 -0700 (PDT)
Date: Mon, 28 Sep 2026 14:36:25 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Qualcomm Maili SoC
Message-ID: <cjxdoxqc7744q7gbgkbarcuaujkesa5sd4zhwhi4vzlhy2s4i4@zzfalkwc54qs>
References: <20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AZbN5vMleNYs4I7EVxxgcHjgCNNw0rLm
X-Proofpoint-GUID: AZbN5vMleNYs4I7EVxxgcHjgCNNw0rLm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0NiBTYWx0ZWRfX4pUYz9kfmj3p
 ehjBKQcr1MwpMU6osQv0R27qZDYu63f/lG3/cov3ZbhwdrFknldnGJMoe6A5G7/IC4kApvpcG+U
 CNtA8KvVS23EWS6cbXOAO7uQRpdf6G0=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba513d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=LJH_WNpccHY5IcrVEfcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0NiBTYWx0ZWRfX6HD82hAn4WIM
 M02+8vv9iYMLEcq6n1eL2v4ZI0kOQmQfbuWnLZwPk7IrH5ai/r/WULlgm3V8Ugs2THZgHNzjK1l
 NZOS9nrp+YrZk7GHmR+54pNLmU8sVlHMyVi83thBKNY0uUngy7/ChXtbhN0lHgskbQRXGvhAANs
 sIaGvTwhQ1bpdDwTOksTN61xCQ8Epty+IAzE1F5reXq+D0wsRC8pZueMEVHunwOvHsooj1pxlUl
 tO/GQ9Wuzxk99U3utBqZ4PlQkQFEw4Xj+qUPaPtQO9nD290JIGzu8u9sReJkT9TdFXEOR7hQzOi
 7+gIY9fJzG9f5TCfOdpVWaO7fRs5Sgka+mQNR3n6p6nt4IrkzogYIWXvcfi4N8QfM/zulWCbXVm
 Qi38IEj5hle/zQRKax1FHZK1bgOe/MgTjS28vor2oLYmSrsHClXYtBb7UjCD5TxGFPFCNsHI8Wv
 0AEghdeHJAniCiFN8Nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280046

On 26-08-31 20:53:44, Fenglin Wu wrote:
> The PMIC arbiter in the Qualcomm Maili SoC is version v8.5, which
> is the same with Hawi and compatible with Glymur. Hence, add a string
> for "qcom,maili-spmi-pmic-arb" as a compatible entry for
> "qcom,glymur-spmi-pmic-arb".
> 
> Reviewed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
