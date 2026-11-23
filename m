Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462923;
	b=Old/ZlBg9BBevZyo4MeGvfpGjk/wNgrmaLnomSbWtD+d0TuOZfsbgcPV5pOMlQrSKbBc
	 SfNlXx1VCToWLtUgayMcN+aYb75Xlv5EQ39o2naT2n3ekTK+GaGL3jyq6B0167xdsES4x
	 YNyUwh/OBOH96v69oUR3DGDV/LOPhdtxfVcYLlalK4r99C51y9YD11Ld5AdDntUYPIgwG
	 UKw6mhhkdfdYxra7s8kalRBffSsy/pkwxeOoWuKzFamE0nKPa5XyX7TrDwMGErWHYfpnK
	 OQLvEiGmn3LjC/jxCOycO0wp4JMAg8K7BKcPSzbKom3XMX3YozVmq3l4cXLY+lAfkqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462923;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZP1stIFjrR21WZH3nap4hGQwnj0u77S9FayUUaRW8Zk=;
	b=eNawC9shmFNmidRe7X2cnSKV3j38jDGLExvEFmHpVmc70Lu3njL1d9kceU/HsRnq/AzW
	 MJfpFzs9REb5phe79GF7YpHfLOuPjfBTCKZM29pOkZXh852cZwWmkcsFDiNKwlRZsoXGj
	 Qkr1Ol2Xslln+okiQPQGu67MDZmBc+XV63yfM/EyGARCPLkWi1I9rLHWGPwt7uFFkpx+X
	 Bb9jIp5fSuJeYYd2Mtl+7JJ3On1LCgYSSilNSc/2sC4t77QDcCZlm/ot94pkjbVPW1tC0
	 Vej/yZLwQBwBSkfgTM+xHafXsD3hBydSGuwW8AYUU4UtJqQpwy0PbWcwypNidUVksUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cgl6mHPa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CMQFhAA9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20694606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20694606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cgl6mHPa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CMQFhAA9
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH44X1093889
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZP1stIFjrR21WZH3nap4hGQw
	nj0u77S9FayUUaRW8Zk=; b=Cgl6mHPaapfmVqEjDLCoi8m8UoIOCaiyU+o1IE4m
	/brL+hrT4eMFEVrdu5g2E8AWyTIONXkiLJXkzjFCPkqHfyKKMyuusXmsJMvmPcVc
	9tzlRSPqI7h8JdbaXm2s6AtA+HO6uPEF7d3IeWN52ptz+Ih/XsauATIF0nFB1K8/
	74Gsm0ztzlG/3knvjkac/GG6YM6E+R3nMjGCMfJeRc633jdP7LXCuHY72+AQiIcG
	0bZkDCzy4gUsrciYDgWOXmim8RD+l3i/HUrZ01tGVh5Cp8WlAtKCQU4GzuXYdzk3
	mAQ979y3apdgKqm4o2DkGIyUccv1kL/Ki0wm7APq1OiERg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0t307-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:42:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d322fbso534668685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462921; x=1796067721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZP1stIFjrR21WZH3nap4hGQwnj0u77S9FayUUaRW8Zk=;
        b=CMQFhAA90A8zgDFfaal0hJGucgt+fkeROOG2ihpZgnY5Jfrk6zK9x/I7DsrYSij7pG
         22BJHDLyImHZyoEkdHyo3+5jgnmIej/+2W660lFtLq6E9UxGsxOvFrxw4bF9lQLKVgz0
         pHqDduEhd5drC9rj3nV8QY+h130+ViCccypNhOL9ktc5wugM4k54KcwKrs18578UBfrF
         YJ5UNv19Xq2JEwiscEdUIbuAn1scik7YnuwCj8FkHwVLn85l+QS8A3DMQJ8Qb0KQcFMX
         frqxG5bkSjbXaDwXTEPjreZj7pWp+y+q7JIRorYKo8Q//QjOm2mMol0+6SFL/GU9Xe9x
         pZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462921; x=1796067721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZP1stIFjrR21WZH3nap4hGQwnj0u77S9FayUUaRW8Zk=;
        b=VDsWV4tTKPMHvJBLlJdqm8aEusjLJcH9NNjD7QOUDJY4tmPjoi+P3b0rXBGS+s1V+J
         XURYr/mLzJiZQPJG4NJljGg4IP50wo/CbUr7nmuaK+upDnKOOR+GscAz0S865NqaSS3Q
         k9VOZ/Oic6S0ZH6xEg+SUNZHWTR0SRFKtWhLyCH8+3CLoZ/m8x2RRZUNMTxPz26z1zfE
         TV3PSbOdM+3+dpyTtFbj7nzS+40Z1K6/g74bZN6henTTaGjlJoI4D1PUi98wz3tRmgCI
         9Fzz7gFulSBWu6KfJ34w0Cdzhn6RS5Rq8jRO7Gpv6/EFj2Abl9ZNA6XbCtOKI536cCnl
         mNsQ==
X-Forwarded-Encrypted: i=1; AL+hErGhZBNs+tPmswn3nM9vm5DhDgQ1xSf79qwqregskCIAkLGbT6vh9czajwe1abPLICVshqeRQFrdAoF3DDWv@vger.kernel.org
X-Gm-Message-State: APuU4Z973juKo2aZkD/zkR2EyR3V4sQXUr5GphM+tA3Hqzxonf1dN2ae
	NgAfL8ACbjZaFTvLKANXDp7oo4m2li7PVEbKXr6AxqL2V+sjVeRsyO7NT2egzhFB4B/RvcdjKnz
	35SzJdSQyQKeVEAcK6hmlGbH1tRiDUN5bDlvjOKA10Jf7t4fMkzvzNs2sjDrjyuYX7tVF
X-Gm-Gg: AZFdTZcHj/9aWb8a6DRUCcNcfyqQw2eOgoB7Ia6683rqn1oMch4mOeh5OMYP6zo6DYz
	iqnxyZ/Iy4D7kcLPmiEFlTdb96hScjCcs6iNGXRZIrG2mW+D6aIC+1QTcHRqzIChlf7m7/jmmI7
	3IXuDx+LlpC925fHjDaYRN7eAj/f0ghPWpe0L1z1BF5SpJ05dKxBkdoOqirraRqO/oLAMlOfQ8T
	ZQ3ER+HVrOF7KxCx2kJj53KUM1hEmzf9L8TRcCPP00wMGGA5PYxsYlaUrPysn4pU1WmT7y+7NuF
	79cDt0VrIqvN4gJ+JYhVjUhMtG9w+FiFySk1ZMy9OPZM+DkT5xgdFQ6V39gRxsdv0WwR8DZHq6y
	tIVXmYZNHUdVcGQwzwQLQ9C0KVcRMWm4W3PpK+MNgu59R9+ZdotGUaKG2s9mOLXpO
X-Received: by 2002:a05:620a:2b4d:b0:93e:b0c3:388d with SMTP id af79cd13be357-949ba80fa24mr1912904985a.11.1795462921274;
        Mon, 23 Nov 2026 11:42:01 -0800 (PST)
X-Received: by 2002:a05:620a:2b4d:b0:93e:b0c3:388d with SMTP id af79cd13be357-949ba80fa24mr1912899285a.11.1795462920551;
        Mon, 23 Nov 2026 11:42:00 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm24938335f8f.8.2026.11.23.11.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:41:59 -0800 (PST)
Date: Mon, 23 Nov 2026 21:41:58 +0200
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
Subject: Re: [PATCH RESEND v4 16/20] arm64: dts: qcom: kaanapali: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <4ktoys4kreu45oyhzovmdc3pryzcynecdwqczuzjjppqqaqlca@m4flgwzgfpqn>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-16-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-16-be30526391d9@oss.qualcomm.com>
X-Proofpoint-GUID: 4nH7mIfaYDycAuUOchwcwGbMBAIJERwn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX6GKGFXPl2r8W
 QxpkE/Ck8oL1oo1OJH9ma4ggJwgKmoLSi+urXqZgpKoU7IAKWkZzw2aWl6mror6TCQfQSdi0WUW
 BT5uxcxUmzx/Y5h/hAUs7dfggCewiks=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX3SObuvrKIQAp
 NZWV3BxeLxQFhB7/il/kaFE9Ji8tD7R6VVWjHp479inzrGjFY6R2VLjk2fIeZAp+i1p/574/2ue
 e+xzqDIyN/VV7qEhJB4riOSqj3H9EL2QEivzgeC9RoOVeI3RnxXfWUsyD2uL5LLPhdID0u6ULqF
 2E7VOvXQU0b56Xy+qP98jetNzU43S9PXOzGNeGfAQU/JvrpBOcufmnRjdw9tXs5vlgPEMyOGgpR
 HhYg04c7U68zmti44OjOewZ+fQnoW7U12rcF844GG/g2BiLa/RW0K7p/lMUvQv8kf7n4YxrUtMK
 YWn9TE4bwokcXBZNgq6Ug/h3Zrxc+H6prX02dBZJEpNdf1O+YmEwGJzqQJjAuA8Bx+4JyqnOxU+
 AxFGZUcYA3r+FAissodcQDE3dTOrIlx2Z3qACA6V0cCoJsI+vFLRZ0xO5MUAhYQsdm04BXXR9/N
 q+Q0QgmHXSN+9XWdCzA==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b04970a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qO984ec2hPs5we56H4QA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 4nH7mIfaYDycAuUOchwcwGbMBAIJERwn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:47, Bibek Kumar Patro wrote:
> On Kaanapali the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
