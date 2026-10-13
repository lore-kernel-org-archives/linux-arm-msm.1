Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74E631618B
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885295; cv=none; b=qpPhRSXurIwSbtN0bQs8qGY53nj33C/epEQ0mIeFtjPqmIKGnB70G/vMJXmLwFO+pFcf7vUbRlZNAFw4T3Dl0eedFPbgHU/WkY7YxGU/+LpAfWcglFdir2STJUIuJOAS/zT/9YjP+PRIOVw57XTyob1VUf70Rap9E2UUUxWh3is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885295; c=relaxed/simple;
	bh=+OLiagMgWVwiaEgdpANht7956xLnbOvQ6Sd9gYJe3vA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8C6frHkYJS/oSbWmeHEbkPBKaefDF4ZywfCzNTwjKoFpynbGq98SO5ktgyF2gBehn4ZP0EDM3TfjnSDOkXr7mZQje0zT9LM1yP063Co8vbQL6bejPDkmKzD1YxBsBGm6Z8/W9gZeQxtLXvupjE1qeEChLPPAoEXtGbCcfvPDMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZ2RPWf6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJBO9HFR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZ2RPWf6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJBO9HFR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9ZL573476315
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LWB+OXH5LYblsMnILwMBUNHd
	OB45czwc5OzV0SWkFR4=; b=CZ2RPWf6teD/B7cJ3lAr2j8q85J4fOrTFUJWQWYc
	NyNhjHzHjJ3XI2FsyJlKhhr2hsCJqj7/qoeYhlPQwLPIUZ62SVfJ157waQLIh2FQ
	+e7X/B7SIfxeanwjKw27B/R/zOMHcbkaKrQTuD0wBOy+UP/LZwxrk8MLugQOn8yE
	yeqJNUTc7MzLfR/YYFLjFlelmlRdMUasdMCIgZ2iWKX/mt0fjgUjOslOHRqzxajr
	CxTtfHpZ9/7tyZp60RqYBi2aDLBTl6tLEoHY2Bdfhg6US6J99A8/b9Z/iYv+oFl5
	dYpJGEnla3HHJzHULl6AwHSsx2acF0vdyqpqZaQo2GETbg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j9cr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:54:53 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-151ba226e1bso2721841c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 02:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885293; x=1792490093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LWB+OXH5LYblsMnILwMBUNHdOB45czwc5OzV0SWkFR4=;
        b=RJBO9HFRBuOFMyU7DPVdZX/8G3kh2OcZFzQo7krk/moTXl35phuPr2c34qUgufUySH
         WbSrPINxkrnHGrbBoA3JTfyJuHAtYxFfTdctY4aXJgZNs19PquGNA/l9xHLgwVLl770N
         q6aRrXiX0sVs1r5W118VBJvwSo0P2J8sUYSxhFx6NeYBULshwQsLRl0YnEKMOZ0lk6Vd
         +QxaYAtSxj+XYCpQKu7geM6OfIVZgzsddIihQ4FvBCPGRXdiJ10a8X9gmQW1MlpGJeZl
         4j2A+LNfHLNDa4/4OiIJU8UZA2sd/x3c7SJxl5Q0YB9GchXLLdddPuOjg4uB7fkumFyn
         BemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885293; x=1792490093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWB+OXH5LYblsMnILwMBUNHdOB45czwc5OzV0SWkFR4=;
        b=GymeTkFJQ37g+7fEZFBt65OiU7ZHT8JXmlX1E1Y62aP+vLspqo3eO1M4AkCwMXP1vW
         s3oabTAmls5qRJwq6LvE2WRyFeljAtYqMgL5+nIRlsjQykLrVdZQctTvH6Xz3snq0OdC
         s2NmlhTsAtdDztWtdTg2R/ZZJ45t9jVgMRkqM+W1SU9UOun/6QN1m5RO7GvBgQab0Rs+
         yP8XK1qIlJDlr7nUfgm0OybTX0FoEFziPT57aF6pFBvrUa0rWA3XD84C1wEoS28zCcKV
         hqhFpAds0uZgjCgIv1f5hQf9hIA56QUqvL7Qz9XdK7nzm5ygzLQzjKHs1ErItCifOYad
         FWsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNYLvKBULB/dimuHGFLkF1tVUYlA2KkMLhPl963iMa7hXOlHD0y5u4fhLkwqw4waIOg+T01I1vuwTf19HF@vger.kernel.org
X-Gm-Message-State: AFq9FYIKBj3M/BV7BXmTQb4CVcWphuqN/NiZQ4DbnNdUgPy/o7kT9HNg
	e0gBeBb4X3/g2gc+lPk/ajKVGLToGfoPqNJHKNmAV8h9PK/flgrxxNt/Iy9QIyx4HwOUPnUuco+
	NNzMjVzIplBHZNgKoZfmrmCaiumJPpIbPQpu1y1kRH5/bMB0eD3ssjz1iOPRisJuiYfOx
X-Gm-Gg: AYBFou0eF0VtoO9xISNGRlfJMUJ+3f8bVamlpZITh6l5wqVkCdrw5zFZXzypd/o1KoR
	bWUv5ucN+GxMzf/WFt/D70qqtH/7Qy1LvMOop8kbGXFN2BNEwvJG8mHFNS/5VNvMh+Pr7l+YRkC
	zMrNuwnPkMldz4m9Nu3X5Zydb12+AvgMhPQ9YiXFkZEWFINxKBlym4N5X8n/2v7BPTg2Dy251wm
	dQHKu/ZN3t0zgWRL0V7EVDGbBO8+dY8whbx4hLGJr+fzbo8/H/MSlrTHHqgl5K2D3CtOSoUdBwL
	EnbB7+iTWgnH6fFFIOSSWHjbOEdyEkpo5RB0+C1yHr1K9LQopdIx+9kIrWYp/sLnBHflNEZ82Ec
	/YCKZFYBJdtaEOLo9GpZbtZNVA2gJYYjhxZrdXGJS+A==
X-Received: by 2002:a05:701b:2512:b0:16a:8ffd:4977 with SMTP id a92af1059eb24-16a8ffd49d9mr13383729c88.17.1791885292373;
        Tue, 13 Oct 2026 02:54:52 -0700 (PDT)
X-Received: by 2002:a05:701b:2512:b0:16a:8ffd:4977 with SMTP id a92af1059eb24-16a8ffd49d9mr13383688c88.17.1791885291785;
        Tue, 13 Oct 2026 02:54:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2f17feasm49088474c88.9.2026.10.13.02.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:54:51 -0700 (PDT)
Date: Tue, 13 Oct 2026 17:54:44 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH v3 2/6] clk: qcom: negcc-nord: keep GPU2 CFG clock
 enabled via critical CBCR
Message-ID: <as3_5EFx01FaNFmJ@QCOM-aGQu4IUr3Y>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
 <20260724-nords_mm_v1-v3-2-32b45232217f@oss.qualcomm.com>
 <as2gyLK95eXM0WgM@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as2gyLK95eXM0WgM@QCOM-aGQu4IUr3Y>
X-Proofpoint-GUID: ui74yJufzrnBFDzPadgsmRREkA6jjVcw
X-Proofpoint-ORIG-GUID: ui74yJufzrnBFDzPadgsmRREkA6jjVcw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfXwAjXshDsuMBS
 WhmpptDbNXOqfK3g+TO3IKguWRKCazRga3yWWGEKuvEpO3pUjO1toVFZPIa3bNwH62wvhDFMqiy
 3kPDvyJg5BVXdHV9wkz/BfwXGqUubSo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX/9G3ZMJOZz/U
 f6nXZaefCVvxyPIQTD8xSRNfd2hAjW/CYdIx4TOAyEVP+dHJGGyxsoKuKij9IOeEpxnFTUy7RB5
 xuG/z3KAUwZcaGRfhhXV+UqSvfS8AbhEP7lZEF0OuNR2avV2Qje5iorQeJalJ7IG1uIu1dj7Yca
 CdxCsx/8bS440CFcVItJuQJ3QDOQaQPrFj4gJq4seXlUpMsFztWJBr8X05NzP7N3pRwa0YX9CK3
 3RIkePV22fYW9NcRYbvKoG06nIizNm175S/GRQzGsgZBlD7PA8yhC+KIFauE+L9cU+hB6+9TGI1
 718epYW/60G7dGiMf4/NK46yuDz17Id646PXLkYX9PbN14vo5f1vTx82wAL3LGNpTd9R4hkOL4h
 Ay2eqlbuOhb2gP7CSviCrNHTn2CxknpRpGsowQzq/USfcaDhbAiyOXm25LgS+qY2T6HdC2KhZ0t
 1JLCyRUqK3zYloTJp3g==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6acdffed cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=jzFoA3KV1EJShhAgrA4A:9 a=CjuIK1q_8ugA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130039

On Tue, Oct 13, 2026 at 11:08:56AM +0800, Shawn Guo wrote:
> On Fri, Jul 24, 2026 at 04:25:06PM +0530, Taniya Das wrote:
> > The GPU2 CFG clock must remain enabled for correct operation and
> > should not be exposed as a controllable clk_branch.
> 
> Hi Taniya,
> 
> Could you share a bit more information why this is the case? I do not
> seem to get any problem when testing without this change.

Never mind! I can see the issue it fixes now.

Shawn
