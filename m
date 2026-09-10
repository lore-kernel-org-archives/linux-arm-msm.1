Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3083733986F
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022856; cv=none; b=ur3Mq9dHyFCm4CMjSAoM/9bRr+XiVeQTHjBnknCXUkXgNm2KEVxcENwdYmTZelj1Ut3BCyZLEE0fOo+PenD7jwqNl7/ar+ruWQsuyqV/oTVM4lKYsUyUgGroEIOXJN6H3biu3jXJS6WjXbTdNDFlmGS/WzVU35weqhKynCKTk/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022856; c=relaxed/simple;
	bh=DxoTJMN/+LqAjPVtnWiKH/bCmxKlerXb11PgAdqBhaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjcO4EC4QpZKhMImAH3blzBzTIFG6+46Vq07qq7yFllDqhckvWsbPsF6lhfTd4ja/l3TeOYMhhRTm0LlhsSCt2gmfrT9xNSyYip9XlX4SpLy/PQeKq7O2wLAuQA5vfE4hX7r3qgCu583TsYY7BtpHqvKRL8xxb4vFkPipjfs//g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETH+St8D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h7ICDJz0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETH+St8D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h7ICDJz0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GlX24058728
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YFPGqIoHsHzOQ/AB7GpsF1lM
	lefggCSvMh3OTOdNvHE=; b=ETH+St8DBeVm5VrpEeOhD9UdiWWjSt3eN1NMZpCE
	yNowZjNgaDUR9XltGCKhPsLZhsNYSU7HYlE+Z1dRVTBp/90tBYeXGr6ZPBkZKD94
	V+QVJD3QTWoPxhdrDsSSPbf9SDdyw8QoCYZBdMM6swuVcKLJziYkzO9eW6lWJ8Gm
	hhaArxqZGQyi8MzbdC/02+oZ3q3wJ3nMoDXfcpsE0jyGPK3qj/GKUCei/tiRPQ2w
	GwX6qhSSmNM4t8f3zE1tQRKhcISaUO12rTh7UPBUQyWMzIMJVkGyHotBFqAw/KHn
	EYstR7gSaxEgQ7fqKN7GoxOQhcgscBZpSmsbQSQkrrp2jg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfth33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:47:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db050d469fso10369455ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 23:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789022853; x=1789627653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YFPGqIoHsHzOQ/AB7GpsF1lMlefggCSvMh3OTOdNvHE=;
        b=h7ICDJz046TCnk5MwZI1cXrx/TyX3+W6H5jSum9FhNz+V63KhphSZg5guYex81OBgN
         HNaqIL0tbegcWAaAMfzOwlIAzUBjPiIm8DT3tbWjxBSmh+JIfnIOwB986BdMJMGCnjrU
         7jCY6rZ7V+PAHG9JehcSDoe8MLZCQD7pSAOh8+L3iWwRqr+yanQIOsKWNsBZJ+8+w+cE
         36Z1BOx7qUT0cLCwM/g2mhmUNOx8NmwTSG4o7hCN1IgTeiqS8tfuQArGA07njuV3NQLj
         eWeLFYZpFUpQPpmP/8kZeO53vf/vH+IaRvpjqZyV1h6U4+9zRq6ZRXnxHwP/PbAl5RvQ
         br+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022853; x=1789627653;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YFPGqIoHsHzOQ/AB7GpsF1lMlefggCSvMh3OTOdNvHE=;
        b=eAyVTi+fKCJbB5S19XjlPTznl+DOO5iacivqwphwijj22cjyZTrkGLvtnEdmMljZhs
         ln3jbxIAph+8b1m+6jAzDpyAYMbmx+W4pw89+ALBU9OirPjU2MpdfGW9LX4VBM+MXu/4
         mZoyRS+oV7Cps7PkQ4/VnuBvzElrgu9Ou4PVsoPrGT5ojgysOIvtJJcg9/S+LEUZF7Uu
         aYFiiVgx/I7iuizg7PaQXVvYPM0HDR1zi7SIAhTPqInTBlFQooVnEDHQRw/+APaN4axu
         dErzlkOf2RqOVlctGAv3tNvFGO+HNSx6cKPmPlhdGInqT14gtKIPMVqBNNZmmyTXfRMA
         n0dg==
X-Forwarded-Encrypted: i=1; AKwUvBw0pfIAoWgklp27wSTFjLGWoAlR30B/Bmwd1KYzNyM2OsVlXiVioSItgrZpRv/YOYxPAAq3RYo2BEHxZf3T@vger.kernel.org
X-Gm-Message-State: AFuF++ldL1gpKKZx8+gZlFox9mx47I477TYlBXWLJcYwYBxI8MlbjL68
	yFp/ox1sZKUdfES3+B4gUjjg/B+DogASkW7b6fxdMGTTBkrCc3Gfba8KaOYbzk5M0LS7xHDMxQU
	l6iwM6n2QS9lcDaxxzz2ionqcW/w4V3CSul24m00kIiuIucTU6Xn5TOrugM9rzqmRGmxR
X-Gm-Gg: AYBFou30gQUxNQAdUVuh71mbkNy1riiOZ/fvlZTMWvA2eMupDjO4RFbIdDxrcs2SIzu
	QNo86l0dM/kwQ9cGqhu2KJ11OH1yp4kQulE0Db3ESvox0wx3gPxuiCyvNr5d0TVWUhgZUkmff4V
	vZ71Gh+wL5+IWzFRa09RRqH0QGxL3FkGZhC9DXzk9Q7zkcmwUF8OABxG3QjyZgCL1p3JBnGxgAk
	TpXemufs39ZVhGVVPZ+Ib3wqxxPfFGL2Pi8pHx+OLHUYlxlxrmUsxyR4j3tqzrzDhJDB6BN7ksn
	VAguIMsKDaioY5RJtfxlTsth4jptqU3TRRvwSwsFchg8f/daCJk7h+Y+Cf7Zq0fHhidp61WKDzj
	d7Y3h86shIvcnKTSMbjdWfCG2GDiQN5Rt7Nip0rECBrI=
X-Received: by 2002:a17:90b:4fc5:b0:398:ceed:b903 with SMTP id 98e67ed59e1d1-39d77962e6fmr4114542a91.11.1789022852307;
        Wed, 09 Sep 2026 23:47:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc5:b0:398:ceed:b903 with SMTP id 98e67ed59e1d1-39d77962e6fmr4114497a91.11.1789022851799;
        Wed, 09 Sep 2026 23:47:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm42950318eec.11.2026.09.09.23.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:47:31 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:47:24 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/5] PCI: qcom: Add CGC disable workaround for Nord
 PCIe
Message-ID: <aqJSfG1Mj314rbEU@QCOM-aGQu4IUr3Y>
References: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
 <20260909-nord-v3-3-b0a82721c547@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-nord-v3-3-b0a82721c547@oss.qualcomm.com>
X-Proofpoint-GUID: GVnUIglkiRCxZzlVxNtzBSoH14qkKrd_
X-Authority-Analysis: v=2.4 cv=GNqdgeNK c=1 sm=1 tr=0 ts=6aa25285 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Y4sVft1UDeOkrP7wHAgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: GVnUIglkiRCxZzlVxNtzBSoH14qkKrd_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA3MSBTYWx0ZWRfXxBkfcW+IGzze
 toxZVfydxj5XBe0wYY9RWhuSb9hZrXTu3iOkRcC0kOa48Uz+rig8xukcztsLZmuvuD1kPU52DWk
 o/dqVv+VCmV2bwuRnNyhPC5eEH/FAsvJSgEN2+r9S/mVoFP78sCZ1nMK2E2Sfl1zlu7hYvtN0ew
 KuCQs+75V5g/yXrUumN+AVh+jI7FHlefa9Fuv7v2QWnMeFz3eBgGD6eDekuOSt1hWzGZY9KAMnL
 c038X8LwSKzFuVTvO4P5GKAetpzLRICX+3kIblAjsqz+cyQWICk7LNt7KaHQWLL2XJ9msOzU0HA
 bE8kqX00RpCDfSvBqRh41RMgrygK0bb3dopaSMFjsUnNnYgm/X6h2kCGNbWgD5ZQTFJrbcCiSPh
 8vXm+728IC84CNYYLCk0rWytxEcVF6x8sqS088Bwfs6O/vNUCSs4qgfpdHopyzYDIRflKbtXgXF
 NV8t8MqrP/bZEpfZtaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA3MSBTYWx0ZWRfX9yBnD6dkJ8c9
 z+X+e2+/EItlggXvGf8hUNf6mi6ZnBI8qVC2QzQMoBCLK2l6jhKK780s7eTqyrD2Uym4EmIIqSx
 PRg63ZH0cVfioZqRGGV/4DFvV3p1L1E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100071

On Wed, Sep 09, 2026 at 05:18:18PM +0530, Krishna Chaitanya Chundru wrote:
> Nord requires a workaround to address a timing convergence issue in the
> PCIe power domain. To avoid the issue, set the CORE_CLK_CGC_DIS and
> AUX_PWR_DET bits in PARF_SYS_CTRL after controller initialization.
> 
> The SLV_ACLK_CGC_DIS bit is already configured by hardware reset. This
> change adds the remaining required settings as documented in
> QCTDD11972446.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
