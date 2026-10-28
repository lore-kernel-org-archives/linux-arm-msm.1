Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200930;
	b=3hmPsubhtAWDKeqj/yUA5Oic94mGqAV9KbIO1UrP9mvXAHoSoF4tAGqe0/Zk6vqQgLgU
	 8OzKkx9keMYqkNkcwDt2RHaSo8LhVKliLV3GV50xCn24c9eKKLZOX0pw3r/hhErf6t7aC
	 fkIwDGGsjMd1F7u3lunhKQ4LyJqF5DGSEVImNLzm5s5bJJ+7tfgLDXu3sCdHlgi5HWUFd
	 7j2hp8su/J7ordaZmcJSdI5/MoO6f8BNykpF2sicE2tnDmUEj9RTTW65DDVJqNkf4T35U
	 CvFB03r/WYBZzcqPsWPSbjL7vlW1YprqlqxBStibG8tYJ6Q2dgfOtXIQj818Z344LHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200930;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TsOM5gx90+rJZ5GPjwiuQTfKB9WKWAoyypPWpwhTaFQ=;
	b=za0fkyQPzLhiQNMCssSWcduQ8mDng7fEaSAfymTL1S/Xs66CiRy9EIAKWMoMFh43g0cj
	 Ir2++XZM1DQXM8uPjbF6fY+6B+z/gvVU+gAuIYqdjwFEIxouzufuTBtqv/D7i5Wk8+olD
	 4y8SMVWG1EW2reCxQC0YQp41F3vujBCwrifISNbiyAy85UN4n6XrX+i8MmWdosxAJo/i7
	 MRW74wVS/K9DGaPxYrYjcL5phuvt/bw1ZhLxaSU5mbScDhDbRGWIYIF4b9dhHszWkcZYM
	 r6K2MD7NlnSaSh3ION+Yntr5fiVnlmIB3Atv/wjenwP6dp/y33VvlW+QrqWpsJUXc4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eU1LeMZA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bxPHqA09;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4A7606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B4A7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eU1LeMZA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bxPHqA09
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA5Fu1471897
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TsOM5gx90+rJZ5GPjwiuQTfK
	B9WKWAoyypPWpwhTaFQ=; b=eU1LeMZA28q97D2DY/harWRbh9OVlBRLEsJhSQ0p
	NR2/C2kPBPrscRliPtgpyCtPvKbyaC74Dw6X7mnW+4hZAaYSFi/XRGlQmQqB+8eB
	/7USSRxr7WC1IpgVKDHlA6GUB5C9SSXPhjW808jNoR/lVuNYEuBlZj/76zK77l+Y
	H7wS6CXiPkU7li9UIX+7Ter/ngZ7YnpeYpuvWIxg98FdOG7DsVQ8ZNXN2uGLZ5xU
	oWzGnVtIePuMH6PW2VeoURb02Vj04IApaBnOI9n0sf9ggv2atfSuIfmiEr/t4BEj
	YHXLloHmoLseRBrtgeNy9NBTgfINSBfW/DeI4nDuM3LVPg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehh4dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:22:09 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9907539aff7so1002436241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200929; x=1793805729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TsOM5gx90+rJZ5GPjwiuQTfKB9WKWAoyypPWpwhTaFQ=;
        b=bxPHqA090fASq2Sj7BQ8VYHoX6TqV5xPweM+IjIbUQAQafJ27ji/vXB1kEvRTOhva0
         s4Gdczkxhc6FB6eV3IbaQvNfHCkdzwkFUBfISVmFND0TKhvgr9h97aO12Y5tLcZ9U4zE
         PKe0u+Jzjgc3v6vEIgXGebJcK8DSkYLJ5o0R52ENbTZeXRZIai+z1MjOuMWkSgGd93BX
         4o/NK5bhLvyCiqUg/zrP885TxfDpE+rJS55wOEHVlVc1uBS4xoHyHuovJZToUjQoQ2VI
         PzKNYts9jyaZmkuOqenELg4fCTkLS0Pk/ddPQeDbeieamOqOJ9TB6epOyX85lPykBdr8
         mBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200929; x=1793805729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TsOM5gx90+rJZ5GPjwiuQTfKB9WKWAoyypPWpwhTaFQ=;
        b=sK37K3ex8qAN9eG24JE3+0qiBa1ifP1KOtX1QErqPuj3+gAm1/y5PpG2caYuEuiKiB
         sq96s3q6dDCCzt3J0+Y0aLEJhotS91zsjCZsaGnytFtroYKAmoPRPUldXsWzqu0ujtYj
         gFQNSd7ZkL2Cw+Wgl/m9yB2LW3ZMD9JTW/Mwtw9RCLg+J1qH7ga+saWoKOvg90ggEqH6
         AAxvTn9IDTevC9+6sqoX4qVjHETssmc664xEhaazi6Hg0dNS0r22oqsv005YeDmdqzSN
         bxM09Z291gssDsAnP45j+b/DFK/iQT/l698Bq+KngOfYnVK33i1c9lE6gXFhfdXm6WIN
         8Wgw==
X-Forwarded-Encrypted: i=1; AKwUvBwHF7vL729RwLNYfYSSg/OqjpxiMwUYPx0agavLrZ5e6H6oKpz18KE9Lx3t+Oi2awYp4Tlb619eHj+MtIe1@vger.kernel.org
X-Gm-Message-State: AFq9FYIxeeBEC4J+I+XB86OcubWxRWQ9MFntW0XPiQD6ClgPnKUfYmzu
	i99Rj4Mimf+PtGrZG2z7zuNiRENcszwks+77EfW9zsiOrnhoVo+iY0gvdhMTu2oHbGhgI89gw/l
	YAUAuBsnGzIa04tdK59kondAa/Fl7UlaMOIhe5mGkDxUnxSPjjdn8VydFC8UqvCMoNDNo
X-Gm-Gg: AYBFou0iqXQxxkuQQ42jG7tnjUHHnTqYwnz3pi1BZIxIT4AorQrV8gRagApKRKBMRJO
	Awg3j83QuQayFnLDf4RX9LD+FKITIB3oqFcEF/OI0mBl1yiug4hmuzkEWlczTHYjR8mbzRT6+kO
	E9OpFrkgWSrxW9CTsD93yRWPmrXEefDOgtgikwhaXZPWbj0tqdiuWadTPAG13hqURBt4sVyG8Md
	jeThNRKXHRTzSWtiJJ3hNVMttvWgBZs8eUH4pw2DpTqtEziMxaGo4mvTztLAkKXS2ZZszh0Ah7V
	DJOvMuxfOxk/7WsvkbfLspAsGZf23JBS+uT0MUMaONbLqED6fBuPNWDcjyIuQ5IyL3kAjq09ihm
	t2DJwSMj2Swk2ZxwdhNzoyK0Am+R7MdavvMHQBu04d0e9OXr5UTIlqh2r3VKXOSlIzw==
X-Received: by 2002:a05:6102:3f94:b0:79e:373e:8216 with SMTP id ada2fe7eead31-7d039efc0d7mr1370344137.0.1793200928501;
        Wed, 28 Oct 2026 08:22:08 -0700 (PDT)
X-Received: by 2002:a05:6102:3f94:b0:79e:373e:8216 with SMTP id ada2fe7eead31-7d039efc0d7mr1370286137.0.1793200927824;
        Wed, 28 Oct 2026 08:22:07 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97bf5d5besm62729035e9.5.2026.10.28.08.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:22:06 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:22:04 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sarannya S <sarannya.s@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/4] soc: qcom: smem: add IN_PARTITION_RANGE helper
Message-ID: <hg4bvb7ipjcbkdi5prrpjfw2nd7aux6fo4ynmww5dlutv4aeom@6w6s7vetqi37>
References: <20261028-port-smem-v5-0-121257d490b5@redhat.com>
 <20261028-port-smem-v5-1-121257d490b5@redhat.com>
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
In-Reply-To: <20261028-port-smem-v5-1-121257d490b5@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXyDmxl4NY371T
 rZN8a3myuFUVMBOeqz5lYp8RzuhfIPaE51xVD6qaFrEwnvOtJbo/ZzAbDYAKyeLbpq2smPiWKX8
 wCNzclE1Q1Bu8WVKGF5czFz2UeFADCNH+5cfQZNxoKUwf0n7gafq8HDwJobt5fyAbGch8rro45f
 xivviDiarAkMKqNPUiTJZt0prfU7gaTxCafO8/7gzH32j6hEjcJx6gXKQqOr0sbOHjdDsLDiDZb
 htv7lU+IDgZM+UcQp1GAmqtQ+sT1Zd7oWzK2ZPNR4JmQ9goPv6/hBCwxH+Xbu6ehduBPj4Q/2MT
 PoSDJ1nG679aByQ3uXnQHicJr3GIf8sd6x0ZJOXDtOf3KJX/9S0u0VV+QHymQnJRqN2guTW0ilk
 CYJLIUKDC3O6ehotQ848ePjP/VR3od0fn8Q/mJXlpMo/XNle+T8GJUox7Mf4+9XdghXCvDk9haQ
 g+Jw/sEWHLld0tDPXIw==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae21321 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=nbeb5VeO40VQUgIf2QwA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: YBiQibniOSi584KGvwjnIrWLTP6PmyPm
X-Proofpoint-GUID: YBiQibniOSi584KGvwjnIrWLTP6PmyPm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX7raYVf+Nv6+Q
 GT+oDk1d+c6eCcYYNGZOnUgSW6s1+Rzn2hUOQ3y1DFVqkF3nbXn7x/Suik6maa/OxFV2g+llBFT
 nGXen/HVxwncWf41HstE3Rl2La+UjhA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 10:33:48, Albert Esteve wrote:
> From: Sarannya S <sarannya.s@oss.qualcomm.com>
> 
> Add IN_PARTITION_RANGE() to test that a pointer lies in [start, end]
> and that pointer + size does not wrap.
> 
> Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
