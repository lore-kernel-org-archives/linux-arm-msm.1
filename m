Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463054;
	b=hC2tzcVzH9ZwjvNlJT8P75JjFZHEU6qpZ+4/3PsQAZgILLO2mZi7YQXW55j4Lx7pnQGb
	 DtSEAVKEv0til0qcShTcC0haCilWuQGv10bfZP8qilKnWf6N9ZgBYUqKUGSzMpimNQMem
	 dQR3rrJwwM1fPl5y0SENDf1UDxdXmjPZQMMDwgutWcbrkBO2pVrizhpQDOqZn8pNWtYzk
	 MA1cpIFLzOJyTGzMVazm+NnCjxxjy7UN+7xg7t9WCFfgsP9M23KnE+6iXpeiadI+X2ib+
	 SsQXIKRXqIiPynUIu4HO6h+TU52oN7jduBZ+Ah2btIpvT3dYew9UomPbD89/fMTZx3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463054;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jmqs384t4urG0xO7kZnecCDgSxT8h0KsuOljD4Hr4ko=;
	b=zPquaQRYn9+9iHM8RF78T8KfpciUldu/GwJ0PpC2WraSRNr3JBPCXPodfXDtQa85dAB8
	 qQuZcAF19zII7+kKpxW4GpJTGrKc9MC4zKynY2bPxZspV9kagKpKs/R7jO5GTxNa1QNXy
	 a/rZhvepLc3kMosBdNB5qiahrANDC+vYFsVKG6r4a6B61eJa8TegtsPQy3MAqL6V2i1GT
	 c9YgzG48IgQDbZQ26RRt6YQANlZW2kbNZwvhVHoizgJxrPffjX1D6LknFMGR5Ksldk72c
	 V8SB6uBLYnUUV4KOuei34ocA1mhf+ogCYImBpCxsvNrZdR+nMdYvKTbY1EMf8J9uxbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yxzx6m9m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gpU5hGY5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEB2606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CEB2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yxzx6m9m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gpU5hGY5
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGsG9846530
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jmqs384t4urG0xO7kZnecCDg
	SxT8h0KsuOljD4Hr4ko=; b=Yxzx6m9meyKMWzTUoV4ZM00fA/PyHef1MQwgy++0
	RsvNxCLo4tLsnC2untVDjNHHdCQ9VpYwX5wEUV/++y0CugsVH50C62mvbhDkqYtN
	WsObSAYlGtkK8b7emb42vlaMjRZxilMbLZ4afLPRoE51dE8zanhqyuVJnGu20bxR
	tBfO8q37WsXv6bJzgMAAElayDj89NcOUIajq7PWYVdPaXOeMBhaFW54DESkD9qgI
	TR+irxyQpXpqKCFCc0RFn7BepbJAEt/iaiKHZjXzriyAH6D3O0umBbtlDlMsGc8g
	ED3iJAs96p+kHNqiozocaNlcP5qjyjs3iTh+A6kCtoGgiA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7436t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:44:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495af07676so575391785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463052; x=1796067852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jmqs384t4urG0xO7kZnecCDgSxT8h0KsuOljD4Hr4ko=;
        b=gpU5hGY5YSUjFBfP7kSkXwApklIhrQV5j25H00oudZIZt4sz/siIuGUl5gZscQKPzF
         OKfDDrxl3jhG8qKYCQswA/VxqXpE8l1oXUXapJFgmAWcJxRCbP7or6NB8i1H5YWdmuHt
         eQXEb0sqgOC1asT15SwZbhMgbvL+yMAFUSQKT0c/B892ct1eHAIiDwbj9C9233eQMXYE
         rD+s/sI3HQu615IcLTIu+zpNLCK+kF0R9H6liLEc6SQSZhvbowbLYNC+H1RttZnSOHao
         gTY106Z017xyyy8ffQfEski2hFwCATfgX5/LKcTSwT4HZMVNQgAOeUSMsufZQtvpawER
         xpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463052; x=1796067852;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmqs384t4urG0xO7kZnecCDgSxT8h0KsuOljD4Hr4ko=;
        b=MaCXdMI5RwPSTxF/l0bSGm/8atP8DZVfYus+EAqsop7Cu9mZYCx5s4W90ehV8KwlNE
         1ZPcuwO+hswqebydgpcS3/QTbgjrZ7V7YQwKMLa7DGBEHUX3XOw0fHTOn9JnrecbKApK
         VnyKmF4P6khTxfr0eMc2/tLDf+tWCYvMVcmL0kL+i9Fjvty2WM/ymg+PJb1/zJMXiJ+N
         GlghG08xLYlgcWEYtHqvJuJ0lwgctXx6ELzScOv6CeCMk5TSbCyuhxu7LZKDeJQKNiwS
         aSbGZ1Yehtk/PYbjFbWnueTcFE1W9jewHrqlBCp0quoLGHgyIghLRXdqzsOW5yqvZUe1
         iqdA==
X-Forwarded-Encrypted: i=1; AL+hErHjoPA/YBP/GQRIjF1euEDgES/LErX4h6JYI472ngOK2v1lqbK72fiWYunrNgq53WJlRzLTrmn/o5t6P57u@vger.kernel.org
X-Gm-Message-State: APuU4Z9F2kmkZkTKHX3DE6vzxc3rM7J7ycoZsrEriVZuv27OpK5QtcpT
	dOir7O75HbIQUYbHc7V69Nbx/SzY8aNVCR9i39gHYKwp0WmtH/YpVToEasmgTChhdSyqI/ZzTBH
	WhOmtpjm2jTcLIqMCiUTfprew5fvId9ikNSfPfmDbnT4QHljT6Jmaf4v+gJkOkCoGTP/z
X-Gm-Gg: AZFdTZfCt70IXyHrIngFEw/JrO5I/IVDvSD3rwgL7/2DCocP2+Y4wK+OSWW8YpHX+e2
	WIu7Q6+dFe/HfeolNChrjweOPfRLV9W0sFQdzn53y6/5F3ssBxlkBwQhvsPiUoVOs9uNXQNuGUg
	T3B5YsOt/MBYncvDcadhxe6y3xC269hHwwIXbEBBBPxc+hr0FYoud6kAGzeRHyrmO0NZMmwKkt9
	BdMLx0muvTYic2v/bUdfx7/5uYBP+uMvXXzxPHxF9MblE9S6LPTfI3Nn8G6UP18JA9wJCZCvi6P
	4sNXiPA1EXEFdieUjJAN/ATP5dABAK+g7JXG4L3V+WBl1KofOrMrG7kNZ8mYB76aStTawgsqA6l
	q89vcmS8bWEoLCI5mdmaP24BsvDwzIARBEpNCgCZKoWXEpKWN+PbcoIjs+fT2XDvU
X-Received: by 2002:a05:620a:6481:b0:949:90a3:3ccb with SMTP id af79cd13be357-949ba9fe6e3mr2063646185a.61.1795463051674;
        Mon, 23 Nov 2026 11:44:11 -0800 (PST)
X-Received: by 2002:a05:620a:6481:b0:949:90a3:3ccb with SMTP id af79cd13be357-949ba9fe6e3mr2063640385a.61.1795463051048;
        Mon, 23 Nov 2026 11:44:11 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm27593394f8f.55.2026.11.23.11.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:44:10 -0800 (PST)
Date: Mon, 23 Nov 2026 21:44:09 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 20/20] arm64: dts: qcom: sar2130p: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <lafjekmlbln5uccdgrqqrclgoeu7mrsgxbuze4cu7u7zoyrplq@7qdploxt4a7r>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-20-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-20-be30526391d9@oss.qualcomm.com>
X-Proofpoint-GUID: OrD--dgdIx6mHONH--GiVSxwPy0YRPUx
X-Proofpoint-ORIG-GUID: OrD--dgdIx6mHONH--GiVSxwPy0YRPUx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX5EzA5YObxGLe
 mK4TmlmxC1FSa35c/ZM7VR+YAvQ+JSO8hY0DEW983AFvV6xYDtyp6Caz+tpkgHW4P7titnIsq+l
 rOWd+4/5sKdw4rDVhTc3whZq9CWfoHE=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b04978c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXynSKejd+xzAZ
 AmVzTabW/GGi526PXel/t90XXjI/qR+Qv332cPGkvacKdcHcYnykzi1bmiF2og7lgTGkniewRQ4
 1+x5ifD+6m37Y8EbHtU4lcF5uJpKowXxf/1Bu1cSKqvepqFgTb9048/o2NsWrb1JV8hF80pOmNf
 9h3hcJZ1U0AH+aMGm+6ONT9mYg8jPc6IWoSdREbw+cXphdVHXX21PZ6SyW2h6J9V3xAOithmyAL
 O3WX9xgX6tDtCMwq+3QgGlwOSxla+WRqiFTstVBYTum1algjaTSKcyZ7UKz/QNZqc3qPVUpMgs6
 Kjkxj4j6uOJExhvsluNzr/4KnuGDGeSgbQKsUEnEqKlGRoM+8IwHnJ+odPLF+5f0aJrsX2RyGix
 MoC483RryORPrnOGtx15hATtB06PDiWE8uj/r4bm9569uWVLR/iW5MkjKF1ZKgifFoPAyRxrFDl
 lIbkhP2L82EMfZEo2xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:51, Bibek Kumar Patro wrote:
> On SAR2130P the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
