Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB0B17BCA
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 02:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789352172; cv=none; b=FSZ/wptXvtulYL3QKtE0lFQ7Qekym81fJCe5DO3VFuWCF90+4egtN7juaGeNfQcq5IU5NFPxG7OKoPmAnQnNC0eUf3HismTYPZlH5aMA+geoeowpY/O3f/c0BGTMSzvojHTHlEGQxtY3rFBSsYcu/q5HOvS3c+BQhZRvr5kfvh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789352172; c=relaxed/simple;
	bh=lpVWWp/A2y5xm33udhGlUqR1U3bzlh8VjjycKDx7tzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CpI3pFeV+dYEIkL/tAU/e8jqYfZWY+BmZ9Im3Chvn3fwDkwniMhl2ThttsQFgZUaCKTo+GWGAVWLW9T4d4zWUDcsVaswl2ZPmMvzo45HiRVaFjC7kYDtW9+HlMuKGch/oxq4DfzXXSTvdPhXBXeVLss+MkAqIx4ylKTKyn0UdqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MC9OEsST; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xo1gmHuS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MC9OEsST";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xo1gmHuS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E068T9080618
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 02:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dUlKOakabOfOfKvw0tID44kB
	yEWki54+dGy5HyjJFPo=; b=MC9OEsSTSlK+kxcuIyVDQxfBTRIbTFbL6ALkfxgp
	DELOVZ3naEL6GZa6YlfiGv+dopIHL9cp65W6qWGfR53RUDaIbycBvWTvNz1getL1
	kV+GidfFto+svfwgSkL67CV1gHxQCIm7nx4UyHVvWP8vJf7mzgI/Y9AQpo9OrZM9
	cae5KKkGZcVv0/KpVw3Hy77YLMsRIpuMIX2n7Dd9fbNohf6gTM24YdTpIhZQ1aBF
	ecF+zawMFWjzD2GOod03k+xYUQwhyBy2eiokOMc4Bkynx9kgbs5dgGJOzAcYiaec
	mt/xjQ2IbwVUHHbZlf/jSFTDrujqNPPfWhj+zZT/HZw4ow==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cmn7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 02:16:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so7164814a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 19:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789352170; x=1789956970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dUlKOakabOfOfKvw0tID44kByEWki54+dGy5HyjJFPo=;
        b=Xo1gmHuSrY1KD/E9tgeP149mtsWODNwk68M0CWeIBG4gtbFzL8k6QZxtzieDG3dlEU
         OpEw6SUvxKIDQd4lMPX7Eft6jdTs3LE5qLjeWISptUsQLqGtwIabGAz3jjIwdK7UKrdh
         gl8nQ5NL1oS49kbGj/2zL9P+rWokP52Oxq5nRgvuqZzwJZIhz+zCOYs4l38apuGDZnbp
         LYwh5rCkN3OwH0B1/WcGnIF/BlxIEdos36HZk+oHlpua/2Y2v0Lx5N3RrgVwJy/+S67k
         rqSwa2dPg0pMWql8WWY3jrvloIiJCNkqlBMgxVsxoDPsB/zbHXhwLqpl5PSvZ4lAlDJu
         JhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789352170; x=1789956970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dUlKOakabOfOfKvw0tID44kByEWki54+dGy5HyjJFPo=;
        b=m397moRwmskcLqegPNEYkwO5JShUbwPedTVu/WMNeego+uJMi/8yb5IseKJFPSZxNX
         06l8TcTKMTCGSEf7Uvwrg2UkZWKQrZZrgal9km+hRKzGcTTzEVAho4P1NaUcsrkr4dBQ
         nDEnjq9o/SPRQGf5h5Sf0b562N+rB0UnOg/viNhwPy5r5RBkNET7GeCAj2U1/pgJzLdO
         FT85D7WqYkaOjxDXIdCRxbGmrRIAjQuLaeEZCRpGxj74xYps6xeXkm4bN8da/9eHRpix
         kujkfuSKQ33ujdDj7hFb6i0nL3Zxr3uQMQwRCO8lZA3BeZnqvzcKVK1vLeEDM3vHjxuv
         XIMA==
X-Forwarded-Encrypted: i=1; AKwUvBwBsQ9SADIvhgUpn8O7dKLWjSiVmVIzJ7vbJVqiN+84WRQj7kNYo8r64nCHbOhk/iqyQlhGeRJEZ332nXlc@vger.kernel.org
X-Gm-Message-State: AFuF++lzMqZKN2Lyax8Ei1Pl4YWD8D9I8IzE/xxZ0ozuok5V6/J8DpEN
	NmPLvmljrhwk2q8UaJLdq3qYMXsBZdkRcChgtJ5OXd7G3Mny3H5Nj8zIkd5oWbnLGCrFAzeKKY3
	yzCjGVBCdh8JD4nGcE0KZgg/RBeA5NcSZNhCbM6geVcWZgpwfP1anZ+Wz7U63e8BjaEdj
X-Gm-Gg: AYBFou3YsMwYnZG7jrdHzKZAWLfece/ZtTVVYwY2zgYeBz5raK3V5upQgyRElFNZdcA
	6aHTm2/uZRCbTy/ARKfzJG7ymVF78JTwKlnxUCAjkQRhV80gyszARYuT29qB5Mf2U6QLTsTMiVM
	QMApRxpA+45DuRNgom8DpcTgtW/l++tuz7MYwd9ChT732DmsqdW3wlmX0NjMQHXyDgjoB/eBSul
	78ZSdlb1E3UXKfO9zJ0tBnxZspz1l/bGfps394+Rgzb2h4mtAe9lSjjDU8CtzhNwo3wgC6Tz6/c
	4obQVGn50UZkjYRomSPgtdWjt2JMaRjBMAkcK51ohds8IitnTBCH4Bi3nyhcVLaT9UxhyOjPgLG
	h9At/xxRVzDvZzkHBgR24Qg3OKqMZt+e3cBE8HkXNvbk=
X-Received: by 2002:a17:90b:55c4:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-39dec06ca7fmr1443722a91.14.1789352169986;
        Sun, 13 Sep 2026 19:16:09 -0700 (PDT)
X-Received: by 2002:a17:90b:55c4:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-39dec06ca7fmr1443678a91.14.1789352169614;
        Sun, 13 Sep 2026 19:16:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a8a9sm22477711eec.13.2026.09.13.19.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 19:16:09 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:16:03 +0800
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
Message-ID: <aqdY43X_kskpsjYV@QCOM-aGQu4IUr3Y>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-2-shengchao.guo@oss.qualcomm.com>
 <zsohlfgrvaqxg2wsymmgeiiasstmk3y5t6vj3aj3v6gl6arcqf@dwyie4ondge7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zsohlfgrvaqxg2wsymmgeiiasstmk3y5t6vj3aj3v6gl6arcqf@dwyie4ondge7>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAzMCBTYWx0ZWRfX4G4rCwD3D9oV
 lXWh2ZazRDVrdR2HN8Eh7sAX4drgmf0DOh7IuGPjT8LmDfiFJE+ubatKrZx0eldsj7slfugaamI
 3GWvsSj0SdqeHHwe35x+3NIp3NBJu+1K2x9nCHv9kkLE6okCPDKboSLz2dkaNTVbYrBQ0SHJ04h
 iGmoyQjYgs7Z2Q+lDDau6nqqTrJEP0dCFMQGQzqdjMoMVYqVe0UBkTqHaZFf4sfEw/TDKzenBkx
 oC8ujHfe9sZ8ICTXLHPqBvenWmEqbpuO1KAEwkBzWWWmPcSmDAdx44LfU3Y93dEdwKEwQ8oYOBg
 IXOwwn3mS4c6PU+irjmHG5EsdcBym5hBsfTC7HDSnTAsmk0v2oGqP8yWlghYLnfjkNyAlc4p7Jl
 IhFO7BHDXjQx1Pcmk4XV6x3G9dXt9YdaErLeZ5QtWS1DtY1WxM9PC9zjT0iobUvlmvzXKmdB6yO
 5nbOO8V7PxKrcMafCGA==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa758ea cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Nm0QhUF52wnen16JF4QA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAzMCBTYWx0ZWRfXxBrQJafufeO/
 lyjW3w4k+WoV1xUZaeO4HypDB3nz1Ikv3N/IYds2pp9JTJOKcUllle5U8NcHicLBTwFWEig0bSJ
 Dm9uuWR/Tc+6PlWnn3iM+0aa79Lqatk=
X-Proofpoint-GUID: WTOX65Bf2i0QIJ8AxBo7xEazGvVhbdZT
X-Proofpoint-ORIG-GUID: WTOX65Bf2i0QIJ8AxBo7xEazGvVhbdZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140030

On Sat, Sep 12, 2026 at 06:34:14PM +0300, Abel Vesa wrote:
> On 26-09-11 22:20:36, Shawn Guo wrote:
> > The i2c9/i2c10 and uart9/uart10 pinctrl states shared the same pins and
> > the same "qup1_se2"/"qup1_se3" function name, so the I2C states were
> > indistinguishable from the UART ones and ended up muxing the UART lanes.
> > i2c9 and i2c10 therefore did not work.
> > 
> > Now that the TLMM driver names each lane pair separately, select the
> > lane 0/1 function for I2C and the lane 2/3 function for UART.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> No fixes tag?

The Nord DTS hasn't been picked up. If it's preferable, I can send v15
of Nord DTS to fold this fix.

> 
> Otherwise, LGTM.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Thanks Abel!

Shawn
