Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456061;
	b=zeWqjZnIRFtMvYuYj74UUdut3+5vvBe1Cx0vxbnX2sCmKr1clk29ZK5z+oWT0PQEIQ37
	 Fnx6k0vpxpxOhA3T4NUKz6Oy394gZto7tyh2KrjaaYQkgTuwAo4ibXxZujK9P5784rkXe
	 gvBRGWV4Q8K/56fyJm05pkM2Rq1DhJxw/62srA19ddmUxX0lI2yNgpO+sU98CzjOJxgqD
	 OrK37NmFJs7PX1/aHvJX3xk8eAsGfABzYJNlGgosZcyqb/5R64aWv/UWVWaUephwXvJUM
	 TxgREqEq6J6z75spKY9wiwGyTwB7pDNFx9Xmgx4AqGm9IBZQfAEy9g7az/M85dUKc/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2P97b9+pLX1rELgHYJetOViVYuqQ18+rtDceUL9B0Yk=;
	b=nJyRqiRmJI/b9oOMG6OnKGkuOcnlhReB1zKpdqqjPqMsPG9VlEyxmyVAX52HXPDV3N6j
	 Qc0PNua9r6MYUi5wey6ymHdIe1GqI5M8TKnnGp/SFeRA0taPcXFDusGIQjaIlNH6kDg0E
	 k5wpKgicX6xrHcc/JZKRxPWPlBcbM8LvLydq0NCJJkheT74d1IdYFF4uEB6fXmvgUmYuQ
	 KbCRCe3pEtJd5Ly6vpzJ/xWpmXrMO9assfG30a1aq9V36EgY5C8plOGxYS9scZW+FGOWF
	 XesJLdGdqZFrnnS5m8i6IjGXpu1Xs7ATVqmCvtW2oYnOL95VmqkF//LyctADKc2znWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RkfXQhcV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BP08eHjk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754AA606A320
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 754AA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RkfXQhcV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BP08eHjk
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD00v71848103
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2P97b9+pLX1rELgHYJetOViVYuqQ18+rtDceUL9B0Yk=; b=RkfXQhcV2Gc2FsIM
	BR+1NwXe/fEZC5914jTFgS9eht8hn9w1Do92CpuoWuxQuEzMsdsceHxcLIud85V7
	pSkUuhhhiHAzas02eJtr8LPgZTQnN5KZj7m3yUU0SRqyaeSLZ29WhnSZsS/eChOD
	7PyfnlYRQueaVJP+pm7HYbvMSavX9I7CcWM/U25oIpBZV+KeZ4/9uNh7Y38Vi5RQ
	IuhAUIECW/wsU5q3joWOigacgJvW0rqmvf4tGK7pZtfax1Hyo9lreBVk0VL3yvw+
	xyc0c3x/3QPaidHVxTd5cBS+GAQmsetE+pQWgaMy8/q6cgdmRDR4Bw/ahyCsw3qz
	152koA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nfsb8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:14:20 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso2416883c88.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 07:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456059; x=1794060859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2P97b9+pLX1rELgHYJetOViVYuqQ18+rtDceUL9B0Yk=;
        b=BP08eHjkuMYKzj/TyDsc0gSw2BtkOr5LAVeEWdKvAhD+6snFbOHEjqI9INA8JQuuEu
         twk2ZN7+vxRWMz1hkc3ht5T+831/owAjDXO70LbInOtdZAbpKOdd8Ep9Shwu4qyDmjOS
         GKfe1JBImAuNDc3FnzYikxApqYnvS21oPUlp3qLqUayLzXCBE4Ch+wE1FUzramzFcEQk
         qSTYKLwqbEGb85YSnPJalmEMUPkje4fLYsk/5oFh47ip6i2UKH6v3wr//BowS3CARAWa
         fU3wKRFCn7L8J7qCoAyTb4SntahVsZ2M/Sk+/JA+tE6I8CGeURkbWbrXnMAq7NcFAwa8
         huzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456059; x=1794060859;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2P97b9+pLX1rELgHYJetOViVYuqQ18+rtDceUL9B0Yk=;
        b=bqbUmkdWdP/CoULYWO0MYntwIS5L/YayeYssyRW+Csz/uHfnn82QWzd2oPlrb9FTwy
         yiZGMXkAMTiWSISxiFf+8hzqqqtENTBUkp8tpLiXn5GFXqyLWZjtnYw/URmLu979jfmx
         S4R9Es8cOxQmvgy5Zeuded2095sTP68jiQXAl2eQFYR4bW02dMDQmbbCwaVt6h334z3V
         yMXmPNAj64HkhKK3gAWmB36LBP0OkR0E+SC/LD/kmZ3TIQ7CMPMEahXgWktrLgj6VevS
         OqEL4BXSX8+8KFDeKanNvTDmsIef4H43P97Wg/K5sBEBV9qLAipBampc6JRmnqT/jlSD
         FBuA==
X-Forwarded-Encrypted: i=1; AKwUvBwxFXkfUOGhqqQI7Igj0cmgKdn6mIJ1zav6ewjD8VjPfFeG0RTmtVIi0gM8P5KJb6d4/JfajoxUNaanZZdu@vger.kernel.org
X-Gm-Message-State: AFq9FYI2ZIHzdX4pmTSv/Mn2wwPeKA2ZI/J4+bWifozq0dKEI23vVeHR
	YXPaoObMnwWEVhwOSLhWe+xr4hcUqEPFspAcyTRtCTf7VubAxfnk9a/dF4AjOSU7AtT/tg07cie
	TUkaZrycBTkkHC0zED2kwkpcw0hGsBDDLd+HhMrTee4h4hXglBl7YWVtA7Ca0ou0HBJuA
X-Gm-Gg: AYBFou2iIq4OUUO8wJrvbqA/Oo9SbEmBaDrNp+kelpVkYVOt93BZnhFAj8MSpxlHKum
	USL6BSXR2HpfIOkdAphVEsmi3As5WtRxuh+AN2Pfjmxnkqy51xrT45oIL/wg21KWc3Le7i6U7EE
	84WgXpAR9iA/rlM6ju6PYap0GD2C5mMdgxISEKMTyTIq0zNmU0q/KcQ3rYh4Pbaxo9OtkjD4jov
	58uGU/npwI7uvAXeShnKM/NEI5+i26DzN8tjHWNKXSbj7v6h6NprV9wxwLjLLdehkB38LqTel6s
	fCJQIpL8II4WC7NCfSt7SPpFmYfK8XG+hONKGPffRVM6gbjUo/IW2SfWIANX+Z3Xq0GzJ2wi/tP
	167nPnFwyIvkcHEJxYM9W83B7q4bA9IWnrNUqygki3W5zYvQsXHFMRfIgmNrJegkPbBOTzlttWk
	w=
X-Received: by 2002:a05:7022:7f13:b0:144:eab0:9cbc with SMTP id a92af1059eb24-1ac5e8dea62mr7118316c88.37.1793456058883;
        Sat, 31 Oct 2026 07:14:18 -0700 (PDT)
X-Received: by 2002:a05:7022:7f13:b0:144:eab0:9cbc with SMTP id a92af1059eb24-1ac5e8dea62mr7118252c88.37.1793456058014;
        Sat, 31 Oct 2026 07:14:18 -0700 (PDT)
Received: from [192.168.1.6] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c2e9dsm21015339c88.9.2026.10.31.07.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 07:14:17 -0700 (PDT)
Message-ID: <d35b7934-54e7-425b-a223-570512be0374@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 19:44:08 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/7] media: qcom: camss: Allow CSI2 PHY devices without
 CSIPHY resources
To: Vladimir Zapolskiy <vz@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-4-vz@kernel.org>
 <CAFEp6-16WAoyS+aY2BzPknsMtHa1cSfVYNmYvTKHm_MWqqW_ag@mail.gmail.com>
 <271ccc9b-ccf1-4254-9664-2f00b504a5a9@kernel.org>
Content-Language: en-US
In-Reply-To: <271ccc9b-ccf1-4254-9664-2f00b504a5a9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NiBTYWx0ZWRfX4DKNKTMTQ8A7
 DE+9YLHj8nDytES79Ys8K0ebemJXd4/xMQyrVGyqF3LkNVt2/lf0MNKb4dYl5YffuqWO+Iqrrx+
 0I6JgVz0qsl4fEMwElKNDnZvBpQV7Sw=
X-Proofpoint-GUID: QJgHcmECEIzezjMcuKscTd5j7idwQgc2
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae5f7bc cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=tzcnicmHaCEtZrSMFQwA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: QJgHcmECEIzezjMcuKscTd5j7idwQgc2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NiBTYWx0ZWRfX5cqFY2H0C8t6
 L3clhOfXbSz7OmLK/WDCByg+wvY3gpYrEOqO88hnJAauFZ8lNStG710S075pI0pYgqscITPLucw
 c9L6ab8Lc+s8RdQYfyP2E7kNS970pLSL1cvRVZk0tUMgbICXmn8jWK7BqZy3AWeeVhbb6KUyv6m
 JmFGcqYtXBpzi34ilmisYU53kQA45EJZJs3XV5joD2WDxB6frMFRaubDTNGdK8pMD9p9QALwlMV
 F/GfEXlsWD/Y211otWyjHlHttrjNWamfcQF00Ck33z762hDQcav1qWVQ9Yk/AgAuXZuEmqz/6tE
 FpZB1+HRJeIG+ENbgKFc4LMk5sCcbZeKIU2Bhuvn7jq3YZccA0kdlEJwrHMbLLl+N+qoO5lS9hq
 +vc2DVNY3YYhW8A3WkfclI2bh3qxI2yItXVtAZQJaUMg06MkiB/eVlNQmkOLhHb3XiUaFHeg63Y
 FRF2jjrzxiZ1EOfCFMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310056



On 27-10-2026 22:30, Vladimir Zapolskiy wrote:
> Please note that 'csiphy_res_phy' was introduced a few lines above
> by this change, it's only purpose is to provide the needed supported
> media formats, and this is unavoidable.
> 

Right, agreed. Glymur uses the non-legacy path, but that path still uses
camss->res->csiphy_res in msm_csiphy_subdev_init(), at least to get the
CSIPHY id and supported media formats. That is why Glymur currently has
a non-NULL csiphy_res even though the actual PHY programming is handled
by the standalone CSI2 PHY driver.

> This change follows the assumption that pixel formats from all
> non-legacy PHYs are SDM845 compatible, that's true for this platform,
> it is expected to be true for the most of approaching non-legacy
> platforms, and on demand it may be changed later on.
> 
> The current form likely is the most compact and the least invasive
> change, which gets to the point of supporting CAMSS on platforms
> with no CSIPHY resources given in the CAMSS driver.
> 
> For instance, note, the recently proposed Glymur CAMSS [1] references
> X1E CSIPHY resources, which is actually incorrect, since there is
> no "csiphyX" I/O resources anymore for Glymur. This change can be
> reused for Glymur as well, and its reference to X1E CSIPHYs can be
> dropped, but any better proposal or improvement are welcome.

The intention was not to describe CAMSS-owned CSIPHY I/O resources for
Glymur. This also follows the earlier suggestion to reuse/fall back
to the Hamoa/X1E CAMSS description where possible:

https://lore.kernel.org/all/lepv7cgykrylficddcnnbii3kzxsiei3itcwc4ibq53s33rogi@ndnf7zrtu5ex/

Moving Glymur to .csiphy_res = NULL is possible, but with this fallback
the CSIPHY id comes from the CAMSS port number. Since Glymur uses
CSIPHY ids 0, 1 and 4, that would also require Glymur-specific driver
data and DT/binding updates to describe CSIPHY4 as CAMSS port 4.

Bryan, Loic, do you think we need that change now, or should Glymur keep
the current approach for this DTS series?

-- 
Regards,
Nihal Kumar Gupta

