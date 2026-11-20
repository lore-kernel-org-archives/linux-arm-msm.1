Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204882;
	b=TLsHn6/bZlSn/2CfuwObw24AAHCZtKNUTFGF7/JpN8oZdcwYXmJSc1Z0BspFUij5xPUT
	 0arHx7AZa3igf0d26sQf/7W5gjBM5ydIXj+OsXH4tT+8A65iB9wVrT5ETbTrdq7K1X5vJ
	 FQL8j4X5RBpaP6O3d5YLuXMqCG95nK0QhPbY7/JjcpsZhnwphEhf30GIAtP8V1hSWKhIZ
	 9ABjJ/TsWJs5cgsH67Lp9snob9f1Cxa7XK2yzaYAsn5mY7aG2njvtjP0+eaXr2Y5aZ8Os
	 CJQhBj+kH2H29kXDGBCWMKcq/zEcS0twQfwGldyWgvzx+R6E8KISlAobmorvC1QUxKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204882;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4SyJAAo3HLYSWCOcNDAN3d3UxNgrLZwsVSwo0aTC7mQ=;
	b=nwee6gJp2nk1ZkOAceh71QpeQRUJ8YbxlsaUDpY6AaGfiihMNbYlq4BWYV/Mj0c5GcYZ
	 DeIaegd6Xuz2JIbSwMfVUiswiYl++C9oZUvcWL1zZXcH0erleyiP0AIDGOQaaCgSs37yQ
	 iCne0b7Qfq638OlzowGO169Dh3L/0iBrLdMOM4Zv8pswZeHMYFc9pPgLtpyNwllunXDYK
	 BL7Lg3pYiNOGvhAGY3imzEmsv/pxCoICyHmAUiySmRRTeywiqrSnw1gyVeAR1hpP0RRI7
	 FbxgVeTjzTmugBH4PH2TnY2zLj3OotLVHrA4A+qBRaRP2z58eBPneEKRRZHZsGtPNFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BIMj249M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MGo1gLqb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75F7606A6DD
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 20:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A75F7606A6DD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BIMj249M;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MGo1gLqb
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKJgfSP2862827
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 20:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4SyJAAo3HLYSWCOcNDAN3d3UxNgrLZwsVSwo0aTC7mQ=; b=BIMj249MEPM+TztK
	45nhx8MZV+oOwxbj4S+hNv5LeAn4+RTMI8RYIGy/iMRkQuZPXrokkzL7Ns1h3rob
	rvlfXyBpSft9lqKREK+Q3lHudqGfXh42ZW19vg/b1TsfRAJ1g/Cu8KSNGVPWgwR1
	1r6QCWQmCsyr5M7FqZSn6P3hA+WI4NMpTEkhxyfsbG9kgzHeNOoRJk18rw//r5i/
	nH/S+rc+80+fWqGClSmjlVoNScDGaSyfDspFHM6xW3FQ7cyvogVnMnjnGIqdUVxn
	UQS+LHF6ShhXmImJzucyXW0vh+KjvEcQf/luPwp2LdqUn7FWjTSoexOKGuaLmBI0
	11Z2Fg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2vksg261-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 20:01:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94961511b61so231098885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 12:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795204871; x=1795809671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4SyJAAo3HLYSWCOcNDAN3d3UxNgrLZwsVSwo0aTC7mQ=;
        b=MGo1gLqbWiGJw+Ty9R81evlEi+wrubMvYy8VGv73zFM1bWGevn8fxQ9n4QSEsG5C7f
         Yx33cQPJnLhWCLGNclYDZzuxAh63as7hH3iwfVLBPY9thJ7ZKNYfiN67QEAWzI9bO0T8
         6Pq3B6d/ck7/vd4sQqti0W42VCDkhp52PTtuBbsawTrt/0YOYan/q04bf+QmZ/oXIzGm
         nkEomu3eW9trFAhAG3aEl7Xy/NeRHUFHu8p4wFwN3fijxbAf38eR4yyR9HRcxxRFh/vX
         vgSfiwPWUKZ6S7js+H5fgZK/oEf5g7/vDMeci9MTUzMmlcij9lQ6x6VRypzSIpsuXkdK
         GZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204871; x=1795809671;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4SyJAAo3HLYSWCOcNDAN3d3UxNgrLZwsVSwo0aTC7mQ=;
        b=wYPFDjr0tAVcDbP10CbSeeH7hpdNUFM2nnCL+R82A4/sakSrbn2M74H7zx7p+KjnSI
         /TLIzB3kflbQiJU6yHCvSCJza6cT7LKsfa+OerxKwrqpmLkZTifNoOcrdFfqW8luVXLa
         9VqueFeNjcqULDpSvxi4qR3O75yZ3ACqZIIdg1L/7nlvF3fdPqIwETZhoHRBs3Nac0kL
         Qn54NCiTHXSZFDy4XSoaSOBPyTWJ2y56tLvGUcaDUgGK692jflL0lsB+P+D/K4anduka
         KmWfasR3lF54IpnQIZpTLeL+pVjNQVdXIWFr0xSzFeXQ7jsT8g6+2yAfSN6mcXNP9BnH
         cBNg==
X-Forwarded-Encrypted: i=1; AL+hErGoqaFt7lR0jAVNB8yr3Rh6QdKNTpdb4VPmSjftk7mqaAnHjpaAR1ret/B9goWc6yx6rr4b1RI6SrVBUwOC@vger.kernel.org
X-Gm-Message-State: APuU4Z80dFm9jurp9GAGMLMnEmcG4Bdx0QgrU2iM18e+vqG3OqtM/nnk
	bJH6aA1SOyOpFHvs0pXWfvGJ5CTmRyLhDMuJ2w2ewgm4FHlM/+RLi8loXA9238cYhgPe53NpDn2
	VRRQa+2zigpr4Zt5sT+kr3TayKBBjhAUciHL+vRreRBnLJkVAfWNIsm/XLSs7zdXCQAcD
X-Gm-Gg: AYBFou1XondLMJx/f6zqYqNKa4hw14cGT43BHYwB515+GesqMQkp+FK0sZ2etRDTXp1
	hffkd1CsjftnL2/X6L0Ar4/pebCq7dwjh67cKZUUh2zTEM1mpZPo1SYqqjzVi+YgYVauRPiUZYw
	EqZS3m9sddURI/C8gDqLLXyckTIyiZKmp5KmdTjkiMaFqJBIpATy5kZGB1Fkqi6ml8aZ/pqwgR9
	EzFllUsD7OhfBGvAqqjnLxX401LWAzYibNOk1lQKfi2kKvWYZBk2W87t5etYATBt90nJLnm2oPY
	VCes1tjk85xCGlu1AXyzA/jSMNEFDyB5mj2C/I3RD/Kuri4ahM6we9UeoxosHGa26qIVt2Fr+Yu
	2HYtesgJLATA5WWwOSWfIsf40RhK0AEgUosS0vCoQoqqDquacH+9oIgUmwP64vFH6C2WGIKnm1F
	zLRGRwsKRSrTPK
X-Received: by 2002:a05:620a:2702:b0:949:6fd6:d05c with SMTP id af79cd13be357-949ba9acb3fmr684557485a.42.1795204870515;
        Fri, 20 Nov 2026 12:01:10 -0800 (PST)
X-Received: by 2002:a05:620a:2702:b0:949:6fd6:d05c with SMTP id af79cd13be357-949ba9acb3fmr684549785a.42.1795204869817;
        Fri, 20 Nov 2026 12:01:09 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm171116155e9.14.2026.11.20.12.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 12:01:08 -0800 (PST)
Message-ID: <5485aa11-386e-4648-b27f-f4090bf90d66@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 22:01:07 +0200
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
Subject: Re: [PATCH 0/2] media: qcom: camss: Fix the X1E80100 lite CSID paths
To: Jesse Casco <jesse.casco@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Allan Siriani <allan@fatecpompeia.edu.br>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <cover.1795196107.git.jesse.casco@gmail.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <cover.1795196107.git.jesse.casco@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3OSBTYWx0ZWRfXy9S1u3do9J6B
 V6o7oYcGVnJwoq65Pm0i85ruhiHCxa7r2PJqCp6hCUMur/DiVEcZvH0unWpvBtO67krtBTholhU
 t4LxPgma5iONMEwE96CzuB2CSl3HtoJCthPguPefmGa4p3YzRE8Fkb3WMkxuRRd3kJSiO7HkXOj
 r5NyYNC7ivI/A1BTea/ElwJwEcmq5SZG2r7L4EvewZ6VhJioT505HVphEXNgUWeXxQ/4ehOvO7e
 zP70YdmZfVxD8iiJHQjXksn/JTzkt6J9ZQqS0gpiC2Cs9uFXIaivjrLLzHeNVcEXfk566ycfABl
 0VvJdoE7zeMIoaNMbyjClN2gm2auZetMkXdl6NW9vSm4U7/1gH5iIEO6Z/wyFyN4Hmh2298y3rL
 UMQJvQ2gDe2vj2Qiux4I5BFqIjvy2RO6uPqtYuldKEZWSpgPCVcGzjA6MK+dzaRftdtwPn7cZD8
 0ds0+Gz5dwg4YPHf9gg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3OSBTYWx0ZWRfXzHd0inweTvsq
 Ro7ESlfoqO/LtPhcXvVd8ivADDe6+4plHI/QU/zUJXHxbem2l9q9bWwfbwurzwRZ2Fx1L54GLQf
 EPXj1GuavdP3NGrDCkdoVi/BPN5nIjQ=
X-Proofpoint-ORIG-GUID: nrj0GPvfn4xGjQMY5T5xJAXgh0MDI8sm
X-Authority-Analysis: v=2.4 cv=N7u8hG9B c=1 sm=1 tr=0 ts=6b00a707 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=l8X7r3miTf6CZlqaVsEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: nrj0GPvfn4xGjQMY5T5xJAXgh0MDI8sm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 phishscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200079

Hi Jesse,

On 11/20/2026 7:40 PM, Jesse Casco wrote:
> The X1E80100 CAMSS resources, which Glymur reuses for its CSIDs and VFEs
> (also with Nihal's Glymur-specific resources [1]), have two problems on
> the lite paths:
> 
> - the lite CSIDs are given the full CSID clocks, so their CSI-2
>   receiver is never clocked and they never see a frame;
> - CAMSS assumes CSID n feeds VFE n, but X1E80100 has three full CSIDs
>   and two full VFEs, so CSID_LITE0 powers VFE_LITE1, CSID_LITE1 has no
>   VFE to power and CSID2 powers VFE_LITE0.
> 
> Tested on an Asus Zenbook A16 (Glymur), Linux 7.3 with the X1E80100
> CSID/VFE tables, streaming 8 frames from the HM1092 IR sensor on CSIPHY0
> through each CSID/VFE pair with media-ctl and v4l2-ctl:
> 
>                      before          after
>   CSID0 -> VFE0      8 frames        8 frames
>   CSID1 -> VFE1      8 frames        8 frames
>   LITE0 -> LITE0     no frames       8 frames
>   LITE1 -> LITE1     -EINVAL         8 frames
>   CSID2 -> VFE0      no frames       -EINVAL

Just to note that my opinion is that CSID2 shall be removed from the
resources since can not be used as of today. But others may share
different opinion.

~Gjorgji

> 
> The OV02C10 RGB sensor on CSIPHY4 through LITE1 -> LITE1 also goes from
> -EINVAL to 8 frames. libcamera still captures from both cameras. I ran
> the same tests again with Nihal's v3 [1] applied and the board's CSIPHY4
> link on port@2, with the same results.
> 
> I don't have an X1E80100 machine; testing there would be welcome.
> 
> The series applies on its own and in either order with [1]. Patch 2
> touches vfe_parent_dev_ops_get() like Allan's "media: qcom: camss: do
> not fail CSID power up without a matching VFE" [2]. They don't depend
> on each other; I'm happy to rebase on whichever lands first.
> 
> [1] https://lore.kernel.org/r/20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com
> [2] https://lore.kernel.org/r/20261111135338.27008-5-allan@fatecpompeia.edu.br
> 
> Jesse Casco (2):
>   media: qcom: camss: x1e80100: Use the lite clocks for the lite CSIDs
>   media: qcom: camss: Map each CSID to the VFE it feeds
> 
>  drivers/media/platform/qcom/camss/camss.c | 54 +++++++++++++++++++----
>  1 file changed, 45 insertions(+), 9 deletions(-)
> 
> 
> base-commit: adcad7f4e6332cff3d6d7165f41584899f598534

