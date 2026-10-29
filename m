Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258752;
	b=cFzX2H/EXoAQnQa8KUZL9PmfeiAwfZdb+J5sj4ok9pPEypdUnHFzOJbN4ZmRVdFZzAfW
	 +oWKSuZ24veQCRZ8SAqOEFHlYQ3Hgv8Nx0Z3MMXZ+04voDB8TZZyueBkE16oIeJH/r8fM
	 Ay3RUIaZ1VuYtlVnA6LgUJOi8OT3y9LwThs9eO+TwkbhXyV8S4WpwLjaa8NGntiZFE88d
	 FgXueVeQam+jUNZJlD8BR0J5X6/2x/IlCe9grZ8hGa725ugOMiTeUu504rQ9tjY7pfOZt
	 TpY2VB++TXJfQaWJXJVFpYm6URjKFGdlxwDk5w8AqpM7wh46kP6MPcoqRAfRoj/AYMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258752;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DPr/ruBMl/5HBXMrl9bzUyjfwBosBgVuKL0NnKrAD/w=;
	b=PBGJmJ187Nof6JVhf9GuIosZIgT8nAaP6bfwGdbJDmpKlsM5kfxkz/XUjd8MnPyI8elI
	 szGrIyn4BNh4TMdd25Kxk854tU+CpgPbBK2VvztJs7MZKREdjWua3jypCTZd506m4af82
	 GAXgOadJrgh/pWT9Mwajq9YIB9Bi5FAP+3OtNaCP4zrYKudCCP8irbU1kdpCk9zZJKyYr
	 EYWESAkw6lr5t4/B4qofXF9NvrRWBg14c35OyVmWLpsLCnopp4oe3/DfFjLFmfpBN/u2X
	 68hXOvE664PBEBdOudgWuMZPtz251h2QPXOlmkUoyKszL3r1/9Ho1q5LvHyCTXKkmEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WMbDXrgb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdIHVoeK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801C6606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 07:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 801C6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WMbDXrgb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdIHVoeK
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HUbg2428488
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 07:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DPr/ruBMl/5HBXMrl9bzUyjfwBosBgVuKL0NnKrAD/w=; b=WMbDXrgb+uS8dEwt
	DjFQF79dR1ep6mfPqr4H1gwzFJ35mCShmfFtfCshkwKxnGD56fDCx74h8e2wh97W
	rUa4FlmajEarcIuR6Q+OO3UwbWTaBG9M7G6tyL1Hyk0eqXgQTmA2AN3GWQuKVLx2
	uuPrEMpRfmX4m6Tr6WGDjLPQ1x7AQUvqmUY4SG0SYM/XI/0BffHG5nfx7ysB/YC8
	bO4pu3ADHcqcAyqK71NzhqAo9uuMSs0oPGhhQQ+pSC9SbPPYP44ClEvwwflZF42E
	2sLRkxybcB5FYvZukMxQsiqAG6/QtMMz+nOS7WMD8yljtdKfQFO44Qp1vuXCS/jl
	NHaCnw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb2asy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 07:25:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c70349f65so39371316d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 00:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793258750; x=1793863550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPr/ruBMl/5HBXMrl9bzUyjfwBosBgVuKL0NnKrAD/w=;
        b=gdIHVoeKna41szv8b6gp1libGUqEyqW3ALWQ4rVtsZQIBV93glOGbrGQ6SMqamphub
         WjaNDUtmE599S+X2SUdAZjaKP4wuWfMQA0ZD5mzpnYYNB1CZtnXYm9XWOO+GhbHNGeAf
         Z0Zk8HtjfO0GF/G1/w37i5j4QVxnBiTUpB20xFXxnK4ZnF1tiF2weP8YfMS6lm7L+xyn
         XYa/DNQ9xCf5uICua8u+hBiu3a5kErkUjDRdsWoB2vLdOO9K2qtJVp0GiEXQ6EfocPOo
         fA+nTMEYZnDNyvIKTI9xel0ZPoV9eiqg4LBU+XXKjTD3YNvbZNrvatNe660uGETAXmrs
         wPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793258751; x=1793863551;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPr/ruBMl/5HBXMrl9bzUyjfwBosBgVuKL0NnKrAD/w=;
        b=A7ALNDG6z1lgtqERLK0RKXLbc1b2dhtJ7AG4uDn65cGgPxIVziC9bq9Q+IpBDHPu/D
         5pk7WAsHNp/3X8RVm6a/8/Ag7JaO/02ciWqtTr5b/gKzlnFNhEFmJV3yVRMcGMJvO54b
         EFEEpJkEaIsD47Pdf1YNzqHYnsLZ64sl49DxmDNE2/hJAWpeOx/6uF0B9CZu+HhMZYTP
         ywaUM8GL8TWkB0fHI6OI/3xpL2Yxyek1wbQbbc/IXWfPgbl+71pMnprJh5is9d5aAJAm
         kIl0buhpEPz6P5ERFgRS3hI8I1igopI1N4i0cMzEa4Q5Wr83WzFd1Ka7evj/kzBBAkRZ
         Jlvw==
X-Forwarded-Encrypted: i=1; AKwUvBwXjgib81Qz5rYBihY7ecPGLWEg+sTRwBY/eq8gjozWcxZjSZVFjVOkDdfIyZYtLqOD93u7TcHfAx662S/0@vger.kernel.org
X-Gm-Message-State: AFq9FYJqU2Aw5Ijyk4jtHoTKYi0FBwqOGu9Qetm8DKjah0asYHhsUTcz
	ZhCKyGEIkJV556I8HajTe2S7II0v6gKsl7QRIYrXTo6pvTnPU5PYscKlKsQT00MTPw0nS3SFpXJ
	1Eb3PW7NoIprDjrDgGkgIcWGilNTGyGsgWCNd+2scsf5RnrSvmGelD3mtz7i787WejT4a
X-Gm-Gg: AYBFou1ZmzZpMAgSUoNCODSRm2YuBycIg9i0BQnQEHNzZTelITGY3QO+cOLjKzD+u5B
	t4ImWNXnWI3W3CkJkw/Yq14RrZT9DtTMxo+G3vJna/lkjfsTiBmtd1B4hlCd3wxLbf5hoWQyFMB
	aeiCGrnlmGmH/OmCVW2KA6eLD2fAstjIVWZGA4MNjRV2lwWqld+ytiRA5hCgw9R61wqaG4/2hJx
	BDOj0WbATclPeQRWq+E6sxvOD2skvJAsKdb7dJtk9+Byt8JVtpAZAEdLK9u12nuQgJxLs7Lw0oJ
	r8oCzu5+fW8JLTL+u4bzaHTRClAP9FBSDwGsPq4UsSsB5Vn4Kx32E43PyNzwMiekAHssulBCYIr
	22ttgBbrhcy23r2P6yWanWaI5iJ3oMYLEj2L0iQtfk9Xor2i/cmijFl3aDsMd4ka1pzw79kGBn7
	HawD91xrXbg4N4xA==
X-Received: by 2002:a05:620a:284a:b0:944:6c7:c88 with SMTP id af79cd13be357-94408ce4acdmr614856785a.54.1793258750417;
        Thu, 29 Oct 2026 00:25:50 -0700 (PDT)
X-Received: by 2002:a05:620a:284a:b0:944:6c7:c88 with SMTP id af79cd13be357-94408ce4acdmr614853885a.54.1793258749900;
        Thu, 29 Oct 2026 00:25:49 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e542ed998sm18038106f8f.13.2026.10.29.00.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 00:25:49 -0700 (PDT)
Message-ID: <d59a7591-b4ca-48fe-9f23-335e3bc21d81@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:25:46 +0200
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
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom,camcc-sm8250: add
 interconnect provider
To: Bryan O'Donoghue <bod@kernel.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-2-atanas.filipov@oss.qualcomm.com>
 <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
 <7ca815b3-4712-42e4-996d-4a1e53cad492@oss.qualcomm.com>
 <Sm-FvdxaOiXpzzGo30wECHdQF_-LtUaJCO3mGpBUxXfnVCYjOLE5DhNWdNmOMhYdkR1RMXhPzWuHhsZJkJ_Vzw==@protonmail.internalid>
 <20261028181040.3515955-1-atanas.filipov@oss.qualcomm.com>
 <f0618a27-cee2-4f39-a578-fcbf3c51607a@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <f0618a27-cee2-4f39-a578-fcbf3c51607a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae2f4ff cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bB782UoiXxmDKwpK7Y8A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Hi-YywYTWM9Q7em87-YWgYfvF2m-93rJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyOCBTYWx0ZWRfX4BnI/R9DbR15
 wuFI7B0mJiu6v815zTqRTmYSNrWi+ISfLE3R7ZBJesIJY2bJKGi18s5SNG7X1QnTszfIUrI7z9J
 7iXGk9Y1TPzvs/UQIyksw6s/PBXjvgA=
X-Proofpoint-GUID: Hi-YywYTWM9Q7em87-YWgYfvF2m-93rJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyOCBTYWx0ZWRfXz4ZwGHYE9m70
 NaOnJexg91n3qFBP7poczhO6Ekt34+HuUICDTfyBnDPlqdQMVYMldPyJ8Gt4bm2x3AtXhoj0PzH
 e+mQ/mq9tjqeL6Zu6esYIIznllprwHSo7KU3dcXuyaaFjxeyjfB9DlEDAl3oEzE6t5FwvCTYU1I
 0lZwZHPC/crfkiqt9AX/p4VMZFZ0+JFFOJtJcVXWt8t5tbFsOS4/HOoFs33Uy9p5zCkd3wVlNAa
 li+nuzQnEhArWzyf/J7UQw+Sgn5vrPdXLnjmpgiun/7JtESxE9Pt/jKe6K/iRJVEdob18djckDB
 vO1UQXUmP9tCEKTyRXTt/yjM4IePmJS67vQ43kZ6qaKMaOmfkCn9tflZOd05yadKYGy8InJjX6+
 Zpsp8y+K5HYUwwbqEvASDaDDdYTQfv/y39APFAr59Stu9sENtPC5iCmsVCOcuTvSbAWDcy0dr14
 Jfm6sj5LoyH3nSbRLHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290028



On 10/29/2026 12:00 AM, Bryan O'Donoghue wrote:
> On 28/10/2026 19:10, Atanas Filipov wrote:
>> What clock votes cannot express is why I think the camera NoC is an
>> interconnect:
>>
>>   - The camera NoC is a bus with several independent masters: the VFE
>>     write ports, JPEG and OPE. They share it on the way to the MMSS NoC,
>>     and the camnoc AXI clock sets its throughput.
> 
> I've always conceptually viewed the CamNoc as just another NoC that 
> happens to live inside of the TITAN_TOP_GDSC power-island.
> 
> I think the trouble here is the CAMNOC_AXI_CLK is just one clock, it's 
> not interconnecting any two things at all.
> 
> Noc entries in DT usually look like
> 
> interconnects = <&gem_noc MASTER_AMPSS_M0 0
> 		 &config_noc SLAVE_VENUS_CFG 0>,
> 		<&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI_CH0 0>;
> 		interconnect-names = "cpu-cfg", "video-mem";
> 
> In the second case we're connecting an MMSS port to a DRAM port i.e. two 
> completely separate producers/consumers and we have specific ports that 
> RPM/RPMh is involved in managing.
> 
> Which is not the case for CamNoc - here really we have some shared 
> clocks which we need to calculate across components within the Camera 
> power-island.
> 
> In downstream the CPAs code does that.
> 
> - icc-clk would I think over-provision clocks
> - CCF would as you've observed under-provision
> 
> - But a CPA's analog in upstream which components set/consume ?
> 
> That would work.
> 
> After all what we are doing here _is_ specific to how camera works. We 
> don't really have many - any ? other examples in Qcom SoCs where we lump 
> a number of different semi-independent components into one area - ICP, 
> CDM, VFE, JPEG and ask them to share aggregated clocks - in a way that 
> is specific to - guessing but - specific to how these components get 
> modeled in silicon test benches.
> 
> My vote is to replicate CPAs in upstream with a CPA's icc provider driver.
> 
> The bandwidth calculations are already proven out in downstream and if 
> we get it right - potentially its something downstream could switch to.
> 
> We could even use the interconnect API inside of the CPA's driver but, I 
> think just doing votes via interconnect and icc_set_bw() into icc-clk in 
> the drivers directly won't produce the same bandwidth calculations we 
> have in downstream - which you may loathe downstream code but the clock 
> calculations we'd assume are ~ a pretty good starting point.
> 
> So; make the CPAs driver an icc provider.
> 
> cpas_icc_set() could/should absorb the downstream cam_cpas_hw.c 
> heuristic for calculating the aggregate clocks.
> 
> Its not represented in generic icc-clk right now and as we add in more 
> clocks/SoCs this disparity will grow.

Just to add, there is a CAMNOC interconnect within the camera subsystem
that handles arbitration between the online and offline engines and routes
the data to MMNOC.

It also provides QoS settings, which are currently configured by the VFE driver
as part of set_qos(). Therefore, I agree with Bryan that, if implemented properly,
the downstream driver could switch to this approach in the future.

This raises the question: should we update CAMSS to use the CAMNOC provider and stop
voting directly on MMNOC? CAMNOC could then vote on MNOC based on the aggregated bandwidth
requests from the individual engines.

Regards,
~Gjorgji

> 
> ---
> bod

