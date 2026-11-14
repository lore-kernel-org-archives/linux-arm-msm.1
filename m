Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667817;
	b=5JwRyZAvBYRUSsTO/G9l5kynehSqkvcztWNpla1eOA+E3JFC5JzZ520aOvXjHY9nzNiq
	 syQMIotgwjwkXowfghKZtHQLxeUQXy3l0KQslsKsMpoOWtygi9rYRHe0ZAxB20p2Wz7Ye
	 zE7Fo5hlV2N4V1WK2eZSFr+A0Sx4S6X1TxnezxXwoM8qlUO1rkW28a+UowFDrPCGD7KBR
	 bnvR4yvk6fW3AtJnv8IhdCrACGVO6GcsBK92G83UL8seZnXXLFu1FV/weDGPtRSBmKXF3
	 LrTJYf6Onr4E899JcnIMTXtrHgW1jCF96SO71rcr1OKt8TuHnNlnqqXd2wHRFPalG4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667817;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9jDnWKJJ0pLAld/G+MaxErfbFghz6SX2FaTcRT+rzJw=;
	b=Bj2CIqlYfu1E+7RHXuSBznanfFUZo30J05K61NhZGimWZJkvPqfYEd0+oLqMMKzBl81x
	 5fnZ+v+s6k3FNjMgBRKjcJX4dm5R6nWFRf7WJP5NbBG8+yMh+xgxkHLzhMUDByOCLbn4N
	 BMPCTS2F5sDaIvggSDOSrsAlU2KxCUlrZcQOruZWNmIudpxzz62w8tKZ2ODP7YvES2mdb
	 uxLOmPiq3PkjAS17TK8I43jQTZfa0L76bWMVDEkersDxhIc3zvANAymafzHrBk7MwAkP2
	 WntBOaXDEo9hhrYZIn9nBnZK4d6HI/4MOjV23eXbKcyhepqla5FRokJBcwrHlblRB+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nM9CmwQC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="R/4r8wfQ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD82F606A32E
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 14:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD82F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nM9CmwQC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R/4r8wfQ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDksq4117885
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 14:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9jDnWKJJ0pLAld/G+MaxErfb
	Fghz6SX2FaTcRT+rzJw=; b=nM9CmwQCDWM1Y68yxe98uv8Shx2fbbvjArambs3C
	ov8quEOMm+Dbu1yylZR9bjJNfEHXlDDKAo1hPizmYDAtnK0edBLTfhHulQmRe3W+
	YLgJVAbaJJ6j3IFQ6DpliFGKu/YEstqcivf+2HRS840cmGoOJADrimWdKjJF/RkQ
	apK8ZdOPQwolgelvS8ItdFU1ImP8PcfAdlFs8+J5eXHPNjd/cdopnwCTidNYiZ+O
	LrveVt1ay8dbt7c0HkXbUEbKyO863eiyl0HFa+pXVriQwud9urWfOH8R3V1X4xV7
	npOe5lzlf9GpxRu6X8rihcJ3Axf+JsXamAaHDXCBTXwMCg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqh1bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 14:50:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94967c6d4f4so38822885a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 06:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794667815; x=1795272615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9jDnWKJJ0pLAld/G+MaxErfbFghz6SX2FaTcRT+rzJw=;
        b=R/4r8wfQZLCOmBdjUFepWd30POpqYihRSirArJ6RJCvJzqvIIhnxAyKdnEp09go3Q9
         TIvFvo76FRD9pcJGe8UJ3ylmd7tfBWdeRFtfZ5ALZZY07Fs2Ba0OmKdyxC/eBk68+pUG
         y0CxgmPdTSlnvpShLvKAT3lUkJ8ckEYuDXM4mT+GtBnniRAQmtibQ6WNrN61BZK+r3yX
         ndo3//zifDlj+JliI4lC1QKJwe0h0NNIW6Zk1mquvNHzY3ut6jRHBbDWGElV7XSDbfTY
         qTSSSj722RdtpgP5IVI4juqYOGabMRNzDF8xLFhQLvNM46u9kSjbudEjPl8yz/AFy8VP
         Ub8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667815; x=1795272615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9jDnWKJJ0pLAld/G+MaxErfbFghz6SX2FaTcRT+rzJw=;
        b=zYC5NE0i4KhVyTB060LBo5t1w/3qfdvIChZKZjhyBREXYd3ju7aqC4esE5O/bCcDej
         iX7a5PdQaqajDdVF4iop46nngyCADpzykrGb4P0R7vORB2C93o9dDSsDM480p9FV9XGM
         BW7sH3PfakWFp5cwa41WVOHJ5WvdGUMasnYwOzJIuS931+qnQSbyOmmsHCR6FYebhQwB
         hnqC2SwX8BOsCQAuPOMtOr1/mWu0ZiV12ufk75MYGuibzvySesXSLkM7B4SSxoYD+y8o
         llKEDZT6/XhxYpI8S84VdEJJjq4sIeKSF3QMe0zK9OdSH1x7j9ccRZM8aBB5c7dQBbUt
         JSiQ==
X-Forwarded-Encrypted: i=1; AL+hErEAW5mYrGYWzcz7o/YH8MbURVcgiN2K2DkuZb27/aVwOtxztTmEyaCfomHLVziRHEeTl9sr/tKmzy+ceDOh@vger.kernel.org
X-Gm-Message-State: APuU4Z9z1dB/adDnolSZL3u/FOLSxZbXLP/hnm0FRtWOJjELcfXe3BJ3
	wXIJVNozjEB+bI4j9ckDgSe9pz4swpg1IfYP8kfo/bQOH0z8y8R/XbeRh78vlGA0op82s6tOYkt
	rgo7rv8SRKHZN5Vz3oClu65IU8BmZ+ybPRWYP72qEZn6PBTH/Jo+GjVLlfi7iefr9UkP5
X-Gm-Gg: AYBFou0Euh2hS1Sy0Z7/KL3y3Be1CH/8uCqe12nSuBLuAsLiPNHvWRoG0uzyOL09ktF
	GV0AeYxcJqpey6ck8X2C3L2bC1LchXKMnQ/fgdSmgvHiv/PmUHkKcWyv6CPxJ54Pxf6y7aiyJbj
	xZZdayWXvHqmGfAQT2qNZDg9IB9aPATmtaHFklUtW1++ORqrj/RZ5DLToXGQlhP7B9z5nzBy8IN
	H0bsaxaHLURwuEuJ5hHMVAVzFMRGhyJ43Hpy/0a/qP4r012xrrepj2kafTZD36TCOUBDz9XuH7z
	GoJbwFRNqpiZ6g7hIUNzNvNKyzuuxGGLyepXrjOXyyLOiH+1+wgkbqf9wWjlxMALIa3nfPpiXcW
	f19seShOkutWxef2GqTyFG9kVczKlxmaW1UHGTHJtEZ/VUVMY1U8mumGYXw6wFoeC
X-Received: by 2002:a05:620a:46aa:b0:949:6a51:5643 with SMTP id af79cd13be357-9496a516960mr173679185a.6.1794667814696;
        Sat, 14 Nov 2026 06:50:14 -0800 (PST)
X-Received: by 2002:a05:620a:46aa:b0:949:6a51:5643 with SMTP id af79cd13be357-9496a516960mr173674585a.6.1794667813989;
        Sat, 14 Nov 2026 06:50:13 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7da37b19sm11025041f8f.5.2026.11.14.06.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:50:13 -0800 (PST)
Date: Sat, 14 Nov 2026 16:50:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wei Deng <wei.deng@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mani@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Move the PCIe and UART graph
 nodes to the board DTs
Message-ID: <egxevic5xnzmjxikmr2hsj2tuvco7zjktbyiw6oifjsprgw73a@vflocomd7qds>
References: <20261112-hamoa-dt-fix-v1-1-55efbac840f4@oss.qualcomm.com>
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
In-Reply-To: <20261112-hamoa-dt-fix-v1-1-55efbac840f4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: e6KCOn19mNioJICXRRLjPMd4FqgKPtU2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1OCBTYWx0ZWRfX4QYf79KDU6Tx
 G6PM6Mp+Pv0co90NLdVh6gnOz++OFvci0m8ZMNa41x84hNmgfPuyy+Mg+MdhiRCYukESfOYBsa+
 EXLLIK1cG5YxEgar7p/on8Twv+d9Xl4sPSm5z8qXp3vqZ47O1kWKOIOFb4KyRx3+YWx/9sE9X+x
 u8JRIBQy+3bleTeWNL4aV7fg25QR8yLv/CulYNzGaAMQACn2+tOWKZ8F+dOA00aXZBBE7Efsdkd
 RgCdB5MDCp/S37jHDgBhFsB8hef5/OQvn5hBQgxidZihGE1NcnNADPEq35ztxLNKmGkhlGGc2fv
 MYNRPbvO2o12Gz7hfKMyNusGJlu4eRlyuoxTbICXt+hZN6uXI4YWbaiIjRqbKq2ScMy7nH0fwHp
 B96ionXuaAC0my9RVsl6b1coIBCAImBPR/AjV1/5wnCioDvcmpXD58z5Xf6dbRrA7OzQIruUvDw
 d7ERRZbOmCesW+C1xwQ==
X-Authority-Analysis: v=2.4 cv=TqJzFzXh c=1 sm=1 tr=0 ts=6af87527 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=c6MnNOAcyMoAY2_djnMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: e6KCOn19mNioJICXRRLjPMd4FqgKPtU2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1OCBTYWx0ZWRfX/JF2Y3O5DBj5
 yHz3QCvx/Jfq5R/+dBQBw+JJLSJoFTbgV6af2F8tUzmgGiU6b/bCoE2EJtR1k6XeUxxA408OoaF
 LW0GMkg7593Z/c7UaO3qigmTRxvivUc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140058

On 26-11-12 16:00:25, Manivannan Sadhasivam wrote:
> hamoa.dtsi describes an empty port/endpoint pair under the pcie4 Root Port
> and another one under uart14 node. Both belong to the M.2 Key E connector
> and only the Hamoa and Purwa IoT EVKs ever wire them up. Every other board
> including hamoa.dtsi inherits two dead nodes they never connect.
> 
> Apart from the dead nodes, the change also confuses the pwrctrl driver.
> 
> So drop both pairs from the SoC dtsi and describe them in the two board
> DTs, next to the connector they belong to.
> 
> Fixes: 014501d141ed ("arm64: dts: qcom: hamoa: Add graph port/endpoint anchors to pcie4_port0 and uart14")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
