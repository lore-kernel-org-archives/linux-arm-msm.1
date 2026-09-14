Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577743E5EE7
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372011; cv=none; b=Et+6TvIgeAAnT8FwsctwzsrBQ0VzZX+GGv45zdIKZMu0sJsvSgMRLB21s9BIwUEVfvClpOypZAlFDih/XOl0tAaHCQfWw3i/vOjEeIngH57tmskLMZjoucFeejwr6H1jKEDyjqoWLe+cNYZtPViaeXPpu/fOB6TLO437pDunI9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372011; c=relaxed/simple;
	bh=fpyZ+wO5t6i+lqmqsTg8eqnqZWMjQOVGVNPTv1ziKP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jk5y4QR3TKW/gkCCqadmsv654SIHtuuM3h9Mg6tOFUEj3zbJyywJyYU400VB61rZYtFVnGNSSixTxRNEv1SY8kUy30XYU38PSbi+y/OZXHmMEEqmO9+eLJLFTypdNyV5suKBnrEmXnYzmaOlfMFBvje6ppmcQUtXoEIcnjxj06E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKl83eIz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D1I6OwNH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKl83eIz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D1I6OwNH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5isIG4058214
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nwYpgflsInUUYK4VL8amNhk+
	D/quGcQ98duZ4xjrjTk=; b=KKl83eIzRltCkPZFiyYmI7YU1hfSgBdKpYEdtjza
	VtPwAm9lnBH74olln+D5xlWhg1toP7sqIO9RZDPRX7mcK3n8ddtqlFbIpTOXn/OL
	nNtQq8lNLZ0F3RYu9T7yZzofTvjJryR9bnWr7ktGEhsI1+6uhmev5yH1n6Er3ubL
	1YupiKTHf9SF0cQgiL8PLGyDGq5xerqj6EbjPy91EAxCzUtbSiM1UFDlT/j9qrmv
	cggbMAQOmFOkSJgaUNB1TF4p3APn0/KbBa6Ijq8yz8Gh2JtyRK/X1CI9F8/uxSji
	t+T3eqGF5mE06eo5oBnvW1swEydqI7WqXnHzNCTBbUtDAA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hssdav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:46:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9394ad7f64aso487174685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789372009; x=1789976809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nwYpgflsInUUYK4VL8amNhk+D/quGcQ98duZ4xjrjTk=;
        b=D1I6OwNHJmIp2kAIkNVCoSTb/g+fn9OC31JcYoS+VCrqyu6ag6RqhI5rYJhLWxzVHo
         +dEkB5vIev72LeV6+vQBQ1bF5ctFTmABUjaPh5Tc5sp8Mhd2SkuhZQrcX8Yri6l3C9pf
         UyTSvfA8cpi25baHn/7T4rBzEkYMwnfkXttCKhpTeooH4gDCsiAH2T2ZP5YsDYwgtQDY
         VUjKvFNSRLb/CgVjEZvQGd5ePUBBa053QUCj2JIhe+iuMfW/nBToZ3GEdvwFWzb9hNzk
         50zZ4j/t0hikZxnmYZi1LKSOGCpRht+VG+SoBtWCphnc+dMi/n8/nOS+8W31en9MP8Gy
         hl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789372009; x=1789976809;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nwYpgflsInUUYK4VL8amNhk+D/quGcQ98duZ4xjrjTk=;
        b=U268LppAuO8gt9AyobKbzyGQYk+Kwpo4OWNjItLV2+OVrQZa4/ztTH1qoxdbLDztxW
         c/NbvAHBh7lEBcuRCXJ8k9f1mbLCsqkgANklm3yTu9zgcTinm5zMgfwwss/OnOCEy/E1
         KkObWTOwbIzDw9yB+6JXFvFxlRMZr5cFbsoejtoqXw6Cnew8a2B7toGvcRE+tY+5doj7
         rWp9/kF4c+gvc0pO6JQVv04A3mm/lNFahMR/N+2z9DH7Q5Z06QbFwkValuLaqtttjMyL
         FxqWnRdLckiPZTS80C9NljNQUh1Qq8f3y7a74fUtge7ULk0fMygQh4RBSqbF8PMlnQan
         Q9aQ==
X-Forwarded-Encrypted: i=1; AKwUvByYqUpcYzoUR2it7BWHMS80SgEqVa5qkWoyFjkywcaqfuGv+e+Bh4mQMkhwl6e0v5kvrZ1vAFAZozH5dxs0@vger.kernel.org
X-Gm-Message-State: AFuF++na4n/eUYKWXLGWDd+Rc4pQR64pT2DMta7s+/Ae3b8lc3uedLzN
	9l5Qoqa26hdHzdzySwV2DzUl9igFpDFGqw2EbsrAMVe7upfCBvbBY2vQ8o3qm1h6l+3nFw/ErZE
	jGufCCF+KDc8lC15TJ7aXVkMpdmwObC5Yed54csBQjMIOv4WTamPbjr2SHiL/S5MSp8Phvd6JH8
	vK
X-Gm-Gg: AYBFou3SDyCl/RBbImGLy71+bQg2xH/JowR2rFAfPkfKkqlThcdKGQtfEaQ5UxhwjJ9
	vQhxBI3N3BOgCdob4+gG27mC1+UyNsZ0sZHXenN14dqcNKrs80hys7cohiOLqFB2BSdadgX5bhI
	RLTxzPrXybEGWiDJoJInApc7AqkUJshTZEj60ZMITwXv+6vuqdy/n3s1HsyjXyo/OzWZ5aaj96Z
	R9ICVl67B4PldBfkXP11sgk/EZuhz2Azt/MALsDuTR7j6i4hGp30B/jWLaerBfALE1GqyKyJryT
	NmBt3VQJnsK81q5St/cfxe7h/h1CCnGcTQL2BEGA9naldP+6x/LLGP5jaH/bsUUmsijxE83edaW
	ehffhydhY4Ys+eA==
X-Received: by 2002:a05:620a:170b:b0:939:d38:3ab8 with SMTP id af79cd13be357-93a297e8fadmr185030585a.12.1789372008580;
        Mon, 14 Sep 2026 00:46:48 -0700 (PDT)
X-Received: by 2002:a05:620a:170b:b0:939:d38:3ab8 with SMTP id af79cd13be357-93a297e8fadmr185028285a.12.1789372008058;
        Mon, 14 Sep 2026 00:46:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e0asm429923155e9.1.2026.09.14.00.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:46:47 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:46:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] interconnect: qcom: Add missing depends to Hawi,
 Maili, Nord and Shikra
Message-ID: <4kwnvr6azz2hvnel4ti5epqd7tyj6lzxgbkqobltdthdpmxkym@k6cymd6tah2u>
References: <20260914-interconnect-qcom-clean-arm64-v4-0-5b2c0e6a929a@oss.qualcomm.com>
 <20260914-interconnect-qcom-clean-arm64-v4-2-5b2c0e6a929a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-interconnect-qcom-clean-arm64-v4-2-5b2c0e6a929a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX0ONX852/CaAc
 qlymhqXh5dCUIshHn60zol6IV1rSmluwc1QxU90tI9wyvf/NmzvfOR77mVJlb6jB+uNfGIT/vd9
 d0PuPXY4ntEhFuoQTw8I74mBpfnK2F9KKBXKC/yy4OFOxxNPbT4tHhBCS4bx/7pVE2XuD780DyJ
 7CuI8qlxtHfPQz9DNMSryTgTSeZ9+DLxGfFUu8wjfLFVwWQ+JyUeHloH+ungVlimnq5awsWz7BM
 zFRvTgBZH686p7PjgvQxQFQnlpS3uf4So3E5f/MqCg9WnN7sf92Aql6QTdnS120l7XHo5iBJQay
 DIpepQFFZLabUiYEsFym2X3tmhYhZ0SweJh36ngODK2bF9mw/i8CxKZ+weAB6j/X031HKPz6F+Q
 jwyMvJOgsfcFMfsDaO31yxYjJ1oAYjD+meyqefgkwSSdY97zmUQCUaLFH56z96lGGodftTEvSHH
 wnWG453PpuOrV4ZvedQ==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7a669 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bOu3b-dmFffoK3qT8M0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 7ArEyH6by-q9poDPUNaEIvPHCwFZvB8o
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX4IJMiEK011xz
 +qYgzEmnYmUCs6Z4wuR6RL7m8JDTqqjODsx5qHLzSw5THvk1dKa4cJgklVny5QcUHy0nq3bKA0H
 8RSpEYY3nHaeXOy7scr4VVR0GzqY/sw=
X-Proofpoint-ORIG-GUID: 7ArEyH6by-q9poDPUNaEIvPHCwFZvB8o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140109

On 26-09-14 08:44:05, Krzysztof Kozlowski wrote:
> Hawi, Maili, Nord and Shikra were added in parallel or after
> commit 5b696f065843 ("interconnect: qcom: Restrict drivers per
> ARM/ARM64"), thus they missed the update restricting them per
> architecture (with the same rationale).
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
