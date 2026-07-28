Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E6C2D7DDB
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227378; cv=none; b=k8GtvIVhTjTYDvuwMKqHO6SQLt5EfHYJGlVoAeg0LNLMtD/X07vWIRhnhgvN326MPSSaKYTQd7/oLXg08Q9aGl78JFpMK9Z0WIXW7HE1y5JSeqrpUBnRaazFQ9fMUYlEIgSSfkkDdptEh3sHfU772y0GdTDme5SuwaCV8F4ZQG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227378; c=relaxed/simple;
	bh=7Iq0LQn5O6EveBHZ6S6cONLOFkMSLSLoSstiy8JZJDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hSqFloK9OR0APyulFA39GeWkybZrGVcYDqv8pV5D85eWRWzhEKyBnGNL+4Loo3x4D697VR2xK9BZhYyTnUOfOGOS+DQn6CSmEcbWNHTyD9HEpqaERDzcW+DU2ov+EOhI7Ll3vVEfndKhgyMHq3bt+Dty0xeyjCiC3w9BqxLmu4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyRPv+WB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VW4iR9ev; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyRPv+WB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VW4iR9ev"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S822o91663732
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2Pv0cYpa+ZdimG5xfKaE+l+opYj9jlb4TY2HLV956Q=; b=eyRPv+WBS8MsxXlS
	sPSEooGnlRU2pHr3zW0IizW+Sx4p8oeOpPQbAWfOzAh4YtFulZ04KffU4I0iK/zL
	ffmOOwng/ml+tT/B56SKaczSWw7q68lAMRsTP5jPl0KgwB7cfaKmDOjtklLmB3CB
	JBqku19AntNjHXLFLj3txfg2iGnJL8VzKLjfNfdWaZhlLqvtsPZGqG+0jNbFsDIM
	/LxhwiKUtnCm5/lz/sfO5I4b+QG3TEjV0Y1zRocdZGufgIBnTv7+DuFCFF9XSPuP
	0rb7zA5yGkmtGOv42lf5qoRxBnrrUBGaGjGC1aeH82n/zOKHYyB4IHSqtgdQFai2
	6ZdoAg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fppttrk1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:29:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f21e4e8b66so9210116d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 01:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785227376; x=1785832176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R2Pv0cYpa+ZdimG5xfKaE+l+opYj9jlb4TY2HLV956Q=;
        b=VW4iR9evmTaYk63vsXQVdM/UV5J1f/XuVhE0ubpVF/DwUE0wVWj1Mh8iPiPjT02hCn
         8aklbQggVERG5wDXwn/YVsuxAxK09WfEuCRY/PSQSQPbBYijxVbh3jliWnBp/jTb3COK
         0MLYYEaTnaJzVasKfYnXNLzHZ5dePeYaOY/zjiO301we8+3aUn62cl4prQ/AyJUIAXQN
         vLamlZpMpTMU8h5EgKdRjIOv+tSvyKBOxy9hmj40YXMcCcZLM8ghXH2RxViMxk7dG3pR
         fbzsf6c4N75luGNunYLgoGBLmK8cyfwsefyvHyriwLcnHC+/pkfZ5yXcardd9udgb5QB
         iSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227376; x=1785832176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2Pv0cYpa+ZdimG5xfKaE+l+opYj9jlb4TY2HLV956Q=;
        b=h/UGvs6v0gw/AX6E9Neq/1q/hb3SdLKzt6MtxxOGy7/AF4begNWY5osg1zrx4TFCr9
         UyGZK+rss3R4RssuqEOTjXU5D0B3oju6PD9PC9EUDIjAMJpwt/fxO6PVr7LBocvQtoDs
         mCldc+bUI1fpTHgyrHqNRwRCxuqLMI3rcLZQRd5kNhc9/tjBiVHA4bcvR7uNjTY0y1xf
         dO+dp2V3StACuZYF0ilsWpzRoh2PFEmE0WqUj5MPJV50VHDggcBreK24Zh4a9UI7ef9F
         ycD3y8wppJyrtWJYgLgkeL8TPA4BQdcxO6lbWZbUd6jDuVoN7DGlgmZVF1G6rGgy/cH3
         6pwQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLtH+Rh5LDAlV0qJvInepfmaRUzls2c1IjVyDchxU82yBZz3kIUy/fJVk4RKPrlPoKO46+4Ztkgc5exrTC@vger.kernel.org
X-Gm-Message-State: AOJu0YzibRQld20+o+iA1VU7p8S2JHw/0cxMsJQ35bP7oL85gY+BWHZM
	nFTQJ0/h9D+mB/iSXhf53NU+NVQBD0iY+wHNYslTyHT+PoCILUk+C5geEyhNck4ufErJfhxU888
	ZznB0E56n4oDFCLPEVErM+nh+EArJBK1aGAnsnKYi23i9et5FTyN5J8GotfgKo7igiEZiGwKf+2
	fV
X-Gm-Gg: AR+sD11YDuQ4qOorZNZbiSYbdPnC6UjrbGS28OhiDLLYnYORjWV76pLUFu33JqzyLqK
	1VnTQj+1vRhJaHW/MmoqbwnVguV8KNBcusqGw8Qv1oIo04Ob+A+MEvYiFqwR9YaYFQAqpGGEQpw
	pvNCcqazPkkIf7fa7GISUG4wywyZaMqKwgiqVBDcMegfJvihCImRmveWDNKxHcwXV38JEUVb9Bg
	6DBubTEe55LyRQzakLhnmAGnNcR7N9kJsucFSb4AioyqQeRUgMAbNPPWrcOnkYkybriLbk1Yle9
	3pvUah1dsqMQYuNCxG18QUH23Pm+dbZgs932wv+WheDeFvRasT4c4RasokWzGMxT1ScmFaomEN4
	IpkYHe+zRR6AbKpul0TPTAxdA
X-Received: by 2002:a05:6214:4801:b0:8ef:6fe8:f3e with SMTP id 6a1803df08f44-9081755f3f5mr11138756d6.9.1785227375856;
        Tue, 28 Jul 2026 01:29:35 -0700 (PDT)
X-Received: by 2002:a05:6214:4801:b0:8ef:6fe8:f3e with SMTP id 6a1803df08f44-9081755f3f5mr11138196d6.9.1785227374366;
        Tue, 28 Jul 2026 01:29:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb584459asm3326128a12.24.2026.07.28.01.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:29:33 -0700 (PDT)
Message-ID: <0bae233a-11c3-4bb4-8e88-c7ad84a8035f@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 10:29:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom-qmp: qserdes-com: drop duplicate v8 DP headers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20260722-qmp-drop-duplicate-v8-v1-1-795eb7de0322@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260722-qmp-drop-duplicate-v8-v1-1-795eb7de0322@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA3MiBTYWx0ZWRfX3GXD5Vd+36hS
 4O31dwnQ0RyUpg3YifqKCWxk5Z9Fhs6YY97GEgclbBrKGAAWTAOoubs0lwQvvfbij9PZR9peE4l
 nuk3S2EA0xhDy2Al8HQyP2O6eBcFFrY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA3MiBTYWx0ZWRfX+i01liKlOCbI
 2iL+s7UhKOldjuhgAbIxi1kFvm/GoQ+S2fvXYPaZKz9TuPrfNIbmmAqGiUsDQ+I96Id+IthjMxu
 MmFNiD0MRZWRXXwldyH1gv6uzF3ksYY/SnNTsYPIMWBirjmuMX9HZSH2ySPFrBsZ/8JwkLFp753
 J+ktJ3gB/T8LLi87cDPAuiPVq9a/XqPC4DRwzI/++c59Gfa/fDMmRAyCUc2cvoaVq11FQPkqalx
 az1hcPu9G9QqgVARTuoNLOp1SC1sjADQlStWi9yZLiK0hSdwPx5nMZSm5ZL0/KEa3Z11AkOja4r
 nbiJ+ELoBoAA9PMxz38aT1d8nppUmh7wJb9uva1fN5lkheMEfxM436kYtNquZi8fG5lf4XkqErd
 rOPCDWI6sPWWfttw0+fXYVMuuGsCqIGyxZ9P3OzkGKG36RwijclguIWCe9Xd2owPf/glkh7ccIa
 glV4PTCcCpzfwDdEUjA==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a686870 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=bnj_P2jiaM4SVWFz6EcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: kDo7RyoXG-b5wNFYOt99aakunERsyRiu
X-Proofpoint-ORIG-GUID: kDo7RyoXG-b5wNFYOt99aakunERsyRiu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280072

On 7/22/26 12:34 PM, Dmitry Baryshkov wrote:
> Commit 212cdedcac11 ("phy: qcom-qmp: qserdes-com: Add v8
> DP-specific qserdes register offsets") and commit d10736db98d2 ("phy:
> qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
> added identical header files for DisplayPort-specific registers on V8
> PHYs, having different names. Get rid of one of the copies, reverting
> commit d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and
> settings for Glymur platforms")
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
