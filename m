Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493349;
	b=Vbn4dXgWSwnaBF5IyFjJ5Omgkbd+dO82lZfIac2/7R4ttft4ut/jUyzB8JpPLag3Ca33
	 8FYUfbDuwY/jx0dG1dQCJtPPgv0jE/LpuvwTOasU2LMkxx/pSYFk0CbwqH1cV8wd21xfR
	 DDEwwp9FanutRLwQedOyDRNE7jtWQmWe3UmtmsKxzR0rrQpZoQ7yHR57pqXEzxlB2EWEO
	 5Ep/2LyU8AY9XoGsDirOW7akddN1znMybY3hCl3SVyZ5qu7GNkntxDGQdCNTgyxFvZ+VQ
	 OvgKGJbMiTLgAWXqoTKu/yKPsu6k3V9aYQutSnT3dA4WFWh4qWaGyuGpoEJ6Ol23Rkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=trCl0IagpgcoO8afehRhGBb553RQMJrfCqZC+//rWNY=;
	b=PU2iu6di3ebqNrsYU5fKmhvd8yVEJ/CP4+zWkuKT3YrFiC3hXru/5y0zjeBTfoL3u2MB
	 iyIU+/HQcf2hUJNKx5HyAMAQPyOg/SVYukqDYGuVTkJHov1hMKFb7nwS2GD40VI+eEooo
	 Ai54CS9lrU8h0BeVaCbMIH7c7hsiwguWE3eH1Q55PbCk4qUqWLUkKXXS84IKHGGG7WOgu
	 YYb0d3uQ8c3TKsY/V2YZcA+/NRYJE2k/0zM3bxwhzY6wcNbb3I/tQQSgpaIx1jxYrBbn8
	 snrA16/HE1rvUvdxg71qXDu5TXVwCv7BUkQrFank4oKTZH7SEo2dN26wZ7d9+e5eQdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AprRcdk4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sg6WbAtu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF83606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FF83606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AprRcdk4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sg6WbAtu
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8DdUg4032819
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	trCl0IagpgcoO8afehRhGBb553RQMJrfCqZC+//rWNY=; b=AprRcdk4LR1jWCUu
	ikTATDCUXNBzvj4py/NyCVz0Y08DJJQrwXULba6OSy/LnqcWRfd8m4zT8pyBYBYI
	pRW0JACZOhkLwLkOaEpLqonPtNHEdcL3Wf/hwgBkVkXkHsNS9+cCf/5X56VpVv/H
	FyYzaIHy95DvineVyNXf44lSFPoYZW9hT3c5Hw5Xy02jTkpB09VyZFwY3kdgF6sR
	415q6sxraurE0DwtR4oJ6PCZ4b4xJOqIES0rWVzl3sjIC1LuBqcOMeHg1SWKVb93
	DBHjZu6V2rIJEGXtqueCLC+c4fy3mwYvTsHt7KPAECmEn2AbVJ7O1Q6yPpE8iN6S
	xv+igw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5qa34t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:49:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1440e081so52667485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 03:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792493346; x=1793098146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trCl0IagpgcoO8afehRhGBb553RQMJrfCqZC+//rWNY=;
        b=Sg6WbAtuppk6NZtWe4wXzS0IbTZ9w4Td82FoAx1pSzbM8Dziljjd6XXz2ZqCgAN0Ar
         8UsdNV5yCsC4Ec0g49eGLt1VV2lMeiEZb1VHMZaW8hySLF4r0MrxHod+zpadE7MTlGmv
         +vk9HETgGMaiK18eaTfsXelsulDc73JcdP6rtdjgE23GxDaQ0WujzJdMPZ6k/2pv98tV
         qHjxuhhsi/hk37nVjpSHq6XKd7inJYai8inu6tYsXq3Pxs7JftaR5SQtJnqDXT20a0qP
         A9gtPDH7p8+hXSOJTSJtulhps4GHKg0tqjaM9nlkZwPGYm6sR1cg5hVi30gTi1RcelHy
         4emw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493346; x=1793098146;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trCl0IagpgcoO8afehRhGBb553RQMJrfCqZC+//rWNY=;
        b=fN3/ZO7uPAJGI0dnL6gGxe+Tr9EcmLPbOwbBuPUio5dHDzEkpEwbTUfg+ZgIASlV7f
         8aOXfU0KbuxzyNPmuGHtDfFXO/1hnoomRPwpAGTFLayiAbHlu6th9MLmoJDunlMxyGnZ
         VkUNmgqTpKfaXcSs6sEp2ZcMECHjtDjtMZGws84V8DiK6QeSpI7QFimXnK+EBfOd657+
         Aj7UYd1lNBpLH078Y0iz3RUgEN1Wg9tz4DmA80+bXKDwXirp/rVqMd83hEK7Elsv3RA3
         ufGaxd3f7UtrgTTQW3xByDvh5N5k39BsDpk8CAhhK0xxgzsAXNi/CxJFD4knvlYSf5vb
         EStw==
X-Gm-Message-State: AFq9FYJ+yS8UW506ILYFQ6iRLeUelzR3+fTisPyo9VlMWcLiVfUh8Dyl
	XvYBqQ6JinV+0fHG8zcP/E6QB7ckphMWDYqowiuRHkGY4tTm53lmnFTT8P0qPKFcXgC99oAXer6
	IbGs8tF7hhCEUkQW+TTw6olf46MYA2e6vbtM4g/ONbmz5f+507IMqrWjOvuR41PVPBvA6kzq78v
	uW
X-Gm-Gg: AYBFou0jQWBjUUfrcxPffokkD72vGzKPBr4N3AzjwPe7h0lowxsXyayODJ1MuPtN0Ji
	D/0FooX/FK/PwGMoj8hWmrvk7pmXPPjDT8YGHo1Sc4z5oxnCECOrwAnA96LPI0UwbftgWOX1jnp
	ksxQytSGSkVv6UiCTOcVhBks6Phg6fRXs0goScAxlcL5AGHc96bxfyNoiDn0lpAEhreQUFkRUO9
	y0LKWlIJiSn8i3yo/y+q2fOC9Naa4oDe67Zpv2dgvP/OoCvN0+UTzo8ClQcSCdVCM+M0oiXbaUH
	IwijPI5HmGdCNb4ISvePKuuw6saF2RV7iPsivbeehF13JTt6o5YVeaSASBwvKxJa/ilSenApDRY
	T0QPU3g4Ref8d0/S9sU9Ucg==
X-Received: by 2002:a05:620a:2a0a:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f29b88632mr1974420785a.1.1792493346577;
        Tue, 20 Oct 2026 03:49:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2a0a:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f29b88632mr1974417485a.1.1792493346081;
        Tue, 20 Oct 2026 03:49:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c416a4be585sm407740466b.68.2026.10.20.03.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:49:05 -0700 (PDT)
Message-ID: <d2719210-26a4-4f9d-82bc-e6aa5ff3f2b3@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:49:02 +0200
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
Subject: Re: [PATCH v6 4/6] phy: qcom: snps-femto-v2: Fix order of arguments
 to qcom_snps_hsphy_write_mask
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
 <20261009-phy-v6-4-50408e45bcc1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-4-50408e45bcc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: icFLZJtDwdp6DOXPT_dJGdu_tRqrqaGe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MiBTYWx0ZWRfX3+KnnHO8vDxw
 WIGsN8/n8Op1Lt0UdWKdsZaEnTC2ybXacQ6qdavRjeA1H/4qwmkgA68560e4itNhXmE1/E30qfn
 nuL3XDjkyQJPgs1eNgklUTfTfAZphqpaMhwIXmCS47J6xbHevpawUgtngwjgXHtAfSq8kFUCmIr
 InsNmvqG7r8zGopmkqwgC+1IGSeJF6VaWXMOXuEQc6FfmYG/e7TvSkW8o4PHCn+jA5nXIqG1E/j
 kPAPp4NFmS70MdWu+s/C6FSPjfDTbTNYhLfQ8wTdifW/akydOCYRUfGznr/gjMRA03Hi2gPZrUF
 UZLTERE80MNXrck1MDl4dP3AY3SIJ5j1/NilRiUSW4Yf4F/AJk0rM9q6wTZw2vMhIryq1FNew2p
 xHXx5GT1olP2DvuccpQd1kaCNq2+x0OCfBduOd+5h7XM9HdFVXS8nJp0affIUB9ddOy8DxdQIP/
 qnvh/vIJ4lAR6FDzJQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MiBTYWx0ZWRfXzrXir8dTfiYJ
 x5fksbnr1U5u4R197tIsGwupmBOb7Vj+QOHgsMWX25NbpV7UmXWW68v+2tI4JAVcD5FJtDK2wi4
 oPziLRe0A8G7JxJCCcJpNb0lrC1Arm4=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad74723 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Iap0342ROmGHmkRQeUEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: icFLZJtDwdp6DOXPT_dJGdu_tRqrqaGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200042

On 10/9/26 6:49 AM, Varadarajan Narayanan wrote:
> Fix the register bit field mask & value argument order while programming
> USB2_PHY_USB_PHY_REFCLK_CTRL in qcom_snps_hsphy_init() and USB2_AUTO_RESUME
> in qcom_snps_hsphy_suspend().
> 
> Fixes: 51e8114f80d07 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")
> Fixes: 0d75f508a9d56 ("phy: qcom-snps: Add runtime suspend and resume handlers")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
