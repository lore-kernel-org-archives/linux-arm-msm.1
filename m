Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A20427FA7
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 12:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784895786; cv=none; b=S+x5Z+DWRlD53VA/M6cLDjcMb9iL5Bp48Ie07no2W/fDIg02kq6hGilg3wgrIYj2P+ymuefFYdnMPu7d6dZan4S26GbGzSbTdv58b9x2JhbfN4c4IVf8B/oAgf2euvsmL8FthtevoG0+ZjidD+BDmxk2zoE+0t04LRSSKlWZKx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784895786; c=relaxed/simple;
	bh=eSJC/HPXN3YTKNn2Z8B6fMEKeWRVybcLVZH7mVe5aGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eIiT4c/AQgBNizPVV0lDBbdJokgu24L7M6Rsc+P/7N20euRJyvEM0bg8ldmSqXOlstFYtWI1Yhspjkt7nVXjFzddG109Ufj6qCvDOOVudCg6k1JOudWsqv5g9JGjVVDz9ekYfDsZMJtzkkKGrtwCOBDQu8tUIH2X8/RAqhM7Gss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOA7KUZy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vg1eptdd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOA7KUZy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vg1eptdd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADUg72720574
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 12:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	swyQuDarVDN5VJVqjAFVM+bZ5jRGsu+zccVbSS0Cmqc=; b=XOA7KUZy5pk6PVqE
	Nc4Ta5bdbp8FPw6UN6UBTUZItLw0RamLPAjQLYfYFfU9f4lXXakwv4L3C6ubnPOE
	Gz5PjVhI9ZSKdTodG0gQkr0fDrFr/UK5ZBn8MXpnOy6s6PRAIyL8KyAxQoxlhNjC
	65a6mUyMdFY2D/Gn7SB8VIkqPnvGrHPSa/fOrND6nJ/1OZSPfaIMhflF7kMKN0vU
	dPfPcFOnlYFndTitzlIk70aHKkSOF90ZQOiq0UckkepiYDHd+pskcC+vHhDdNrt2
	iCdJR8NASVXn3e63hqKiGF1WTyrfKhFja8u5FDEKyNzcV9FOFwuwvu942F6C4Zgy
	SlLV6g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yagfym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 12:23:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52845bd815bso849811cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 05:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784895782; x=1785500582; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=swyQuDarVDN5VJVqjAFVM+bZ5jRGsu+zccVbSS0Cmqc=;
        b=Vg1eptdd5ZDZDo9lMWaUim9m86/XWDNiq7gEh+zU6XMNI4RHQhYZmiSfZ3c+v1LykQ
         4IzLy6SoGcviKq2R+vHryPdXhOPaM3kNo4aUBn8/vQVKjC3kJHYyPm4XiJeEZ6FoFhq2
         n11umC90C//UdQMyF0EM+KXG1CHNrYJXttadXrAbgE/Lvep2DCp0FCpptnND31oZ6LKp
         XWSgRvFjByi6mjeb/sgXt/6vKVdLFukeUddXyw1rvaBwhFpuPbtlKV5LY/RJyhZCkl/0
         aAUNLyP2xkNjNDlimVe/POVlGvovv/c7kKacUtoQdwdkUTgXf+8D7Si6o4OhnIL6mrMF
         C6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784895782; x=1785500582;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swyQuDarVDN5VJVqjAFVM+bZ5jRGsu+zccVbSS0Cmqc=;
        b=tRlKc3N1qE/Qmwc0avWnY8n86tJRHfaCrBevxbQLByVU7k5jDuAGJfu1EctlDOmgCY
         pRpxtS+FcXjuD2xP6WpXlPn7CnozZJ/w9cXNAsBKbXWrdZZDTGOF4/m0F3qtjQ9le/kQ
         rWsQEqvIxnKOf4PsVZ0WuUVfgl8zKWwhKJpJKMyd01hfMSVDLvG8cenVWvao9GyhqMZn
         oUHkGQqd3b7qTmMIJEXTEwTytN0kOgs877SsW5cJDgia2B8KZ9UnxWYQpJucfYS5MMQD
         NpOteK5RWTkBx/KNKdSHMIzwP5C9MSquXXs5C8AVqTXb+9UbjBr9j/pkwgUnfQzu0J4F
         Zg+Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro5hqXUamZXto0PgSSMwtR7fNIa/L72Wsr++vSYx/oIJwthTmY6n8Hn4zFYIgso80iXCbkeadC2O+W2o+lV@vger.kernel.org
X-Gm-Message-State: AOJu0YztNMx7LFGuTwXAeA0MOlMD92mwIz1bSXBLWDkqbX1gOclRLP2V
	3P0KaYup8lADHJUMUDc/jXReuGDXQubo6tpilqROooTpMCQDXEWqoJky1PL+UsSyDXIuscMhStC
	okqcnM7lb9eajdOGY7FFvu63lGVxm9MYNBoVapLjrWu4nVRrtiPr5D+vHxZV1tr5Ay1Ca
X-Gm-Gg: AR+sD10T3gDNjNXhxCmLHIWr33O5Q2qkrh+SAdz2581tg+efLeZjAOSbifKRF9XOmi7
	P3VW6boYgr7imZKzdYBr0SKdDT2Zv/zUuGxEwVbX0gCWa6YMLTAn1y8AQj8boHrU8bVB4AVACUS
	vhZ53QFuqZZASB85/zgJtWrViU+djvkg4/6tb+V8VCmdMxe8mObsykIjDYtbbJX57Y2eeDhTN9H
	vnwHWwabFcuUcJmHLmURHzqbN/I32IYgbxP5koGG4plJgW8hd/7K/yzHwvymQ/iEHlal2ilzvvN
	K2ngFvOTDj8wEF4WSZvbLUtEj9p5v5k988QSBwh7m69IIMZO+mI/RSfE3UD4QOliJXQGiTih+xH
	WJ0vM84jzme7xNyq3h9XdZ1tp
X-Received: by 2002:a05:622a:6208:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-528496c5744mr31380881cf.3.1784895782002;
        Fri, 24 Jul 2026 05:23:02 -0700 (PDT)
X-Received: by 2002:a05:622a:6208:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-528496c5744mr31380561cf.3.1784895781535;
        Fri, 24 Jul 2026 05:23:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebad78sm339747966b.46.2026.07.24.05.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 05:23:00 -0700 (PDT)
Message-ID: <720eb684-ae89-4003-b167-e427b4d31add@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:22:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] clk: qcom: clean-up simple provider misuse of the
 consumer API
To: Jerome Brunet <jbrunet@baylibre.com>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
 <20260724-clk-provider-simple-clean-v2-2-56f306156d25@baylibre.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-2-56f306156d25@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExMiBTYWx0ZWRfX4BPPGcAQ/OAv
 V6J/hKBDo6iSzrV61Sb6BAXX89ODxZaUOeCisZ2i6RhE2oCzIW0PAiHhdEQj4U9vcRacXu61WhC
 yx+02AgKVKHSqwq0qRMdlwYiCRUSBl4=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a635926 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=20KFwNOVAAAA:8 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=4bE8Fl-H3dgRu3KWX3sA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: P4XV4cZbxbfKVdw77YkExIstNkEyw8kn
X-Proofpoint-ORIG-GUID: P4XV4cZbxbfKVdw77YkExIstNkEyw8kn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExMiBTYWx0ZWRfX+qRuAWYa/POe
 1vLLAImZX1/8bdx3MoAPbNFL46PNO/qXmA1d1e2lTYQ9oGPZLBJAn6bqh8UkluwPMsN2GZ/cDjK
 HvMEWMN38hFLyFKcgoViaoSusZo5y7dDU7U7/TDg9SqjpOoI2NOvPaVZ+hv23Xi1VncGHY4/HG5
 dxeShlqu3bWCn4cMPhTbCvDq2b9d5x5NYPprUCZa3jEftsbZGZILTKzyr5uf2+QJtfg6TuDHeYc
 ciEEG7TYfY0PFC2v8LkBxjf7AcGvYFpenZJ0sPG++qEfe1L8cU/HJwQJg2uQnJVvWuU750ZtNpN
 pWQP2v72fRkFPogMQYyb4+VwbCalz4C5xnXwJrODN01IZNclqeh3tsR+sRWi/CobrQNdyZ22gyg
 6dbp2t0OYyYcEsRY8Dncxm2pdOxFtO0jAxs+DtelucQ7UZcinkUpH8zz4TNqs8URgkfX3UHzqq8
 Uf9eCgEozIY2jSuI6eQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240112

On 7/24/26 11:03 AM, Jerome Brunet wrote:
> Clock provider should not be using the consumer interface.
> In other words, a provider should not be dealing with struct clk.
> 
> This change targets occurrences for which the provider uses the
> consumer interface and corresponding clk_hw interface exist.
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
