Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795498959;
	b=i4r0HoIslGyWo8O/WsQlsMiGmPlf40lUhvJjECXsyjPkaLR0B5CPGsjWvcyKqXYv3YVg
	 v+O90dIbo0aygXYGWOte/aSTktq6l4iDIsq+cFnj8OMQKW/eh6BRZkSUA51uQ/nURoNVg
	 rNZyvZ66yjXs2Fjnpqi3+vyCJeYEzE9CuWVh7Uu/V/PbLiYuFW8oajD1iXbM/h3IOvvnj
	 4GmoQPHP6QyO5JvDvNN0+pHSthU95bL4SBgJz2PY7YQZnLZE5UOkAl6cGMb9Nmre0rUct
	 +g3SlREYY8AHVhev20aDZAK+T73BWYn1SviHbKHQ7uEFIKBpnc/Ov5mAu0t1GMNGdmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795498959;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mtcw8jsnHYBk0jWraJ4U2o4b44X1RjgMIXhXbWzQwx4=;
	b=ZUonfDbU5bY15PUi2Se8/0L8IuE10wnMZClAz7juVgIjfeeXsxvnAlpLGdPh6dVM2ZeR
	 gWxHnOmsygKWrulXaw3h2KobH0ghq2mFVfFBBSlL6kp6PaU0bI2hgID6O0dl4jQIdNzO0
	 bruCrD9IBJgR8LAH8r5PDamHCQoESsmVFziBREj7iSVOpmvgpCr5LoaNP+bwvA5twp2Ki
	 UocalRs8k7dO/Wz86c5zn1wHpcCmTCLaUe3INfaGfZa7iwVo3f0pCqErfdpBrWQYw10G9
	 ncODkGPVprO4jf5+P4sXOZqRQ9Uu1j9h7ZuiTmhY2m5n818jUbfFjGQe/K84ntfn3IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QhvSsuFd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IRj8XSIm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B73606A326
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 05:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6B73606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QhvSsuFd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IRj8XSIm
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kFGi646678
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 05:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mtcw8jsnHYBk0jWraJ4U2o4b
	44X1RjgMIXhXbWzQwx4=; b=QhvSsuFdGpMT+zoH2CvNRzS0chxwt8vs0heppssX
	K/gWUKFlvZ1JXn9msOuPnmpV2TosJDCK1ogcuClPQSRWCfzC97Jj2LhoWGehygrs
	OAjZh/B4TkLEmJc9cUl2fvqWOSjd+EbxRMRxcuEs532C2DFuLrbTjpbkG34Y30j0
	c7I96tGWJBP1f8NIIokG/tTYuL29fwHCAfQ/Prr9c+aF9/1DmHJr3juigDbIfjA6
	GRViufdMYchf2mb6YsRbZoDsrEQSwQ2Emjf++LzxDIwcVu9xMuuq/q5DZjIsRSBF
	PjRkgmLyFZeanOgTGYbunISiUnEZ+289Mm3+wk7WMXycVw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd11qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 05:42:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9211d51dcefso81260306d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 21:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795498957; x=1796103757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mtcw8jsnHYBk0jWraJ4U2o4b44X1RjgMIXhXbWzQwx4=;
        b=IRj8XSImy4BV4vcxHwNHQkoapEP81vgFf0Ssp1qytES1XEXtoCFHg9AAKL30ewf+pT
         c2TyvdrpUgMRSgiYpfIErWTIndVG3v5HUx1Flfv1ph+lnL8wbVvQUPAa2voLvxYrWTKJ
         O7naYKgl0XpD4AYh6ULeUw1+fnxoQxeZXMHP6W8grfc4CsM6cqSyqFAEsaV6vfXPCuFq
         PVbAisOGx9fgFlh+9dMvF/gb5h47tylZY06AKMB6tIiRUhwIYXpuP6Fb7K6NB0dGpQ6s
         jLX0GAGvF/nEmYT5KBnHP2DDQkESdvdNLfS82k+J0zvGqwp6YcfjMBsXzpxXnltHPbvJ
         omPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795498957; x=1796103757;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mtcw8jsnHYBk0jWraJ4U2o4b44X1RjgMIXhXbWzQwx4=;
        b=KKIDtk7aNCQsRSSC4Ae12CZBZLgb7DKDoqp3YXvAWt/lshdPuOtsrip72bpFzm7ENz
         yLh8mCC8Jck+tDlUZ3W9CZG/e47j9C9l0cyH6aB6MFV3tYgYa21UEIlRcK/htOVCyw0d
         jt+vMkczwyvadzIGC5xWFSWtJZR0duMvwD6WeTPCeUMpQUjVg5vqHeZdaNlQVVOk7N6Y
         n2HmlgmUBjqfkz5QvXdm7CszOZMlqwL4enaaANpRSpzmdxA8DG71xitBz0zcN2HkqO43
         yzLpmPUjXqre58bw4+OjK+uyGbLzd9fpkELearqaGDAVED896XXz52EG7m3G3CzM6lKF
         Rx2A==
X-Forwarded-Encrypted: i=1; AL+hErHMIMPmf1YLTgnFPGkUUEbjHvmhrQHLP0HpQqhAs4oMCnrgpdwmsUz30/RFXmRcQj2BZoGqcmHJWXesGWn7@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z/1HA+P9z618cT6oSHTIDTqy1aAqItlrjPC8hCKCxMGE+gKeU
	kq5YrapxacjmKWPan0XRdF7fuRDpPx1/rhO4pxtUdxkp2Im0gG55GD/Ww7W8Jgr7iRl1BSTuQYz
	ZhF8BkUueD3BdGgDYcA4Pg7tHuhz93HEUQYI+CW1uTXr5eGl6IUsuTF7emqhxuSBizXcq
X-Gm-Gg: AZFdTZfvDmL+/DUwgCuZR1yAHfWtHS3IEIPVZ/ALJs0J0nbXjEHhJKOi8Tnk6CpD8tE
	6ck06282w/Njdcbdzt1fN/neJSC+RHwF4+LSvrWchD/8rAsitROF4vXmuX1LIX5/X3BqqV0Xevp
	4DU2dRwOQfyPcYJY39bD7JRdDNoRkKmaPqXmojkIRA8Z2XYsYhLkFDKD85qKRw+1t9QFlY6yHaP
	Iv+GTgDU8gegyAz4PEtx9P/lmwwCw2ZGYm66yjrIGglwxg+FdLpVnlKktvkmZ5M5YhxQ4Lh+JE0
	Zz4fT3OfMY8quRe58N7YgcrvjkNRSu6sB6/rciGAfXaZrI8CSrFmrDfu3OpZ9iZlWIFZSzBWjL5
	YwvYFqOBpFk3om/ocVgGyCnsOwL+mikrV27lbFY5js/iwPCJPRQYL5UqQh8EDzkU=
X-Received: by 2002:a05:620a:462a:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-949bab23b5bmr2355594185a.68.1795498956949;
        Mon, 23 Nov 2026 21:42:36 -0800 (PST)
X-Received: by 2002:a05:620a:462a:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-949bab23b5bmr2355591285a.68.1795498956318;
        Mon, 23 Nov 2026 21:42:36 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm559533395e9.13.2026.11.23.21.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 21:42:35 -0800 (PST)
Date: Tue, 24 Nov 2026 07:42:34 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Tobias Heider <tobias.heider@canonical.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: glymur-dispcc: Stop mdss_mdp and mdss_ahb
 clk_src from getting parked
Message-ID: <qosdtqsrw5cffm26teeopakktx4u7cnhslj3ynth4dx7qvwhct@lcipa56bnnjy>
References: <20261123-glymur-dispcc-park-v1-1-d636ef8e04f6@canonical.com>
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
In-Reply-To: <20261123-glymur-dispcc-park-v1-1-d636ef8e04f6@canonical.com>
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b0523cd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=DfNHnWVPAAAA:8 a=EUspDBNiAAAA:8 a=BncK6HumZM039qfKETQA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyMiBTYWx0ZWRfX4tGvb0PU0eGb
 QwlYPepERn8Q77+6s3mTpZ8GKGBe8pOMsao8fl50xjzpm4Kaho2YniYLmRzq4FQvQ03ya6vDrb+
 TyyRYr4RiThlmlRsPG1boUOrTrkf4IzDt+f6pdGakoBLWJRX9Fvd3ATXIA/MOkTAjplcfxqC2G1
 UG7AoLn4bvxZ38Y7EKyqleBVzAyHLim4IZ81fzoNZiGhaBlG8WDe1ldK5g+Gf+UNUlKMnzYjBMD
 qzY9Wz9VSepzs14Pj2ml/XVCLbN32GH717FL9v+GvCltTKA5Z1RKg3F7K7DUNxc5Ifpubx3Rqp4
 av2dLNHRsFpC4ZWcLUDwSqDCwlIp6qjblO2c/vzuds2psO3R7pk3hFyO2ut6vyyG/bGtAIvjHoF
 qYfIWxLsntHA5KYZz8mMFqvtpYZDLnge1sJq17Ngn4JyvpV35pGok9cDY2E9ODZngj4b0gMX85Z
 N1OwALuq5kwjsz7bnug==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyMiBTYWx0ZWRfX5FIyHzPSjd83
 L4caf9QEhxekJM/tQ6hOItR8y7uzdB588NryTzVQnmN+CDQK2717+QbQo0aTS7aXjPD+ybKXlql
 nnD8aOcHa4h50SJoviGSzRwgtge+NGk=
X-Proofpoint-ORIG-GUID: sY-6MZLbfYEPTHtQMx7B3eeeUSFNAciN
X-Proofpoint-GUID: sY-6MZLbfYEPTHtQMx7B3eeeUSFNAciN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240022

On 26-11-23 21:48:29, Tobias Heider wrote:
> Parking disp_cc_mdss_mdp_clk_src and disp_cc_mdss_ahb_clk_src at 19.2MHz
> kills the EFI GOP framebuffer. The EFI GOP framebuffer should keep working
> until the msm display driver loads, to help with boot debugging and to
> ensure display output when the msm module is not in the initramfs.
> 
> Switch both disp_cc_mdss_mdp_clk_src and disp_cc_mdss_ahb_clk_src over
> to clk_rcg2_shared_no_init_park_ops to keep the EFI framebuffer working
> after binding the glymur-dispcc driver, following the
> precedent of commit bc27dbefae6e ("clk: qcom: x1e80100-dispcc: Stop
> disp_cc_mdss_mdp_clk_src from getting parked") and
> commit 5285b0467578 ("clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src
> at registration time")'
> 
> Unlike x1e80100, where mdss_ahb is never parked, glymur's ahb also
> gets parked. Unparking disp_cc_mdss_mdp_clk_src alone was tested
> on the HP EliteBook X G2q and is not sufficient: the EFI GOP still
> dies unless disp_cc_mdss_ahb_clk_src is left un-parked as well.
> 
> Signed-off-by: Tobias Heider <tobias.heider@canonical.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
