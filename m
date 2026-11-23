Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462786;
	b=Vwzl76V1IIRkLR1m3KSWnJcdcuwtca2RMG2BgFzMhpyY0850+QUD527FgW9uV2Sm+tyu
	 rQChSkzHeITaifpcnyKXksSAlroKQttVrG/2GbIvK7KwsPqcrP1pMRPJsQoH8SXMFrrbW
	 EuwW5FywwcqaYjwNa6LVbl8aJTsclkVN3CPB3tHXX648ekM8xvL0ku9nDyBU2q8RBNaT6
	 uA2vb8crkjI5GbnjE3OJcAAWpdp4fkuqfv/rPjmOJZIr9izrHn/Y+RYLNsgQUNNoxmXh7
	 +jW71NBQz3YcjMc+jrdB3iotWHGN++SWGxN0ZXNWA3pKmeQFhCjkArNobt20JpWJD6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462786;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/AsDNaCeIM26uy2qCHuktfXaKod4efoeozdBzuVQOi8=;
	b=ReTlwYJDqaLoHZzNXRKPYplzI3rVaGroY+gKdwtuFcGarPm9I7XUqH2xjrx+5d4pV/15
	 nPRm+LPZSjF+16U4SG6FIeyTxuxyX5KlT3bnlnSEs/WzWwvi1soaIi8JKyCQMkpcX5pLS
	 UNxDCDvius+UVkXJGZtw/YWuFMB5d9vBjaaj6FqqALP2TmxYCBtBV+fojz6NrlYmSt+zc
	 PJmfPx57tCdAkTYfHHC8ZI175NuMgHDdHbekTkWn9FV2wnqsHkAvzm3fKrwVJcYL6lTcl
	 /2qwAGqmXCsYNBLh7AErmVuksVnbo6KxxlLYt9f7/32R6Vr/yAE2xaQr9m8Qqbaqkvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dCy04Ggb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W0X7kGgZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19FD606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C19FD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dCy04Ggb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W0X7kGgZ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGtSo2340269
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/AsDNaCeIM26uy2qCHuktfXa
	Kod4efoeozdBzuVQOi8=; b=dCy04GgbJinPkzPCZYLQfsGaaerS4ZPo0o+h7QxU
	Y+cCSOzW9p8JUeiaSEkcfHdy8Vec/bNGlEOzsBhXarz5q0uXV8sjetqj0MUXVLRf
	CpFPwIVs3D9xjiDK5GX/8C0az5rsW5YjOLQdBrk0De6+GomJ7bqjlgEwTCEstDpq
	EcDYufpvAd0jwa6rWIJjnwJCcIttAtSDoTB1xaCvtXi67ULdBSZ74Kpyo1FeP6pR
	3J9uq+XSeZkYIhafRuPMBP01XPN4DQBjKBdHxyrKZVw6nn1zX7zQFSNueJLoTOP0
	BYB3oZ5uqtUVuKWJw63dPIqMoHFG4GFSC4TC6dNgGzgpBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3b2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:39:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94960bd17b5so614474585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462783; x=1796067583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/AsDNaCeIM26uy2qCHuktfXaKod4efoeozdBzuVQOi8=;
        b=W0X7kGgZ2EOgGH2Yqu9ILu2Y/Bfg8hiwlF1ZF5ln4LsJ3KQKEe3OE6c1HvTy48yY79
         xzPGobiYLtU3nFnj2rbUl6XYjSo/xdGbM/S00NjMaBmv5cu+/jnj4vlwHp34W9bV8/d8
         PuyY1JdR9LaYaZ3cfaoO1ms3ouMn/EwyNLfQ+YYoerGg3stovcaSGx2jaGDIB5SmDW0w
         k0FmS1XuXr+XdgILSj7G30PuQZSh0LRfR5OzJ7rHpsNiKjETcaFOXQxgi4rnT5AuOJ9X
         vQDJGzacpiWGBLcPYwA0f+85nyC+JDDiuhqgZ+qTvoMfI6teZwg2bXpqATz2t/AznwXr
         eYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462783; x=1796067583;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AsDNaCeIM26uy2qCHuktfXaKod4efoeozdBzuVQOi8=;
        b=Ph+yKsDPSmco3jjjQuL+fWSkZdrEKqSVQg89QZpm34rOgfv83rqlxDSx8dVArcEJek
         3tWMH7bB8g4JY8XY+XiGEzWwRWyEsFfjmsbhIA9e6fdUzsIN0Ov9PM0WmDH6A52ik1qd
         ix4/TD/raVlI/jRaKKm12K22ETnTc6Lee7gfsW8mtmzbTBlbsrnkapqVHAresYG2+4z6
         zpXVFWldCICL1zg71kju+zVyHkdWIIZFpCTODHOMfUa8WVLBDTZt7azkAKlqe1pUPz+5
         8ROvxbmhJ3esToZ7GyHcwRJfZxhZYsvT3jLcVrC4U/GHGwEbYS2HYXWO37PEnc3DA9tk
         LN+w==
X-Forwarded-Encrypted: i=1; AL+hErEXp6G3MggQsxf5DLUCvEQJqcZMfiLSXdWz5aoY5Za/pRkct8KSDD22yQhxFtynphrWqr04iZj06/66qOPl@vger.kernel.org
X-Gm-Message-State: APuU4Z8D/xpT+bH5Z1qDeZ2DSl+q3ZXeNeAyUvHyBaIzAc5LP/GnyomT
	tfkp6sahGYiDMH+LFBR5XvbzjeHKK9kTUO5aBq5mIcJyFaWOvBfEtCpQAZ5a0xQD5DYMwQLh6bw
	/zcPRywA7EsxjKHaGwq7ajsorSNoXH4wOkvsi/Lh/3b8pZ8BQcXjOi+1+q/yQvXisDk4N
X-Gm-Gg: AZFdTZcdecZYQEkI7kww+7NslSZChHT3MRVbOxX5MRPhnlscMNdbd3JoIYauDGa1Mki
	UHl+f7b2eYjhtZLSXm13E+QqItakjaoGXUdZM2nNqOpsgF3+/Vj57lFFkqDBgIJ+EWYnzkow1Gk
	X3eXQXqv4a4hkibPttAQB251kz03mIjFz/HrL2CIZl8whrP1/a4gmqKtxP3LqnRcnudRsYnL6ro
	eEBb6I4zQr4kq2bnM3LN6aM0oFSj2+Pr2puLN8Yvw/bDzw+nFUnqrOD+sdPaJNg9luQQG5yR96t
	OkGaWGlFqyQx4NK5qYBLeTr0mBgRxEj1ITifT6jsYNmeZHZ4ZfvbkpweAGuAyf4kR1K81qO9n3K
	ItW4X043wOfC08Jh0hK3oQ0TMYsZCD8lFjdgFjD4TEGftIqM1zSIRuCOj2lWZERQG
X-Received: by 2002:a05:620a:1724:b0:949:71fa:5b0f with SMTP id af79cd13be357-949baa053dbmr2113160185a.61.1795462782833;
        Mon, 23 Nov 2026 11:39:42 -0800 (PST)
X-Received: by 2002:a05:620a:1724:b0:949:71fa:5b0f with SMTP id af79cd13be357-949baa053dbmr2113153285a.61.1795462782173;
        Mon, 23 Nov 2026 11:39:42 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm27574990f8f.55.2026.11.23.11.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:39:41 -0800 (PST)
Date: Mon, 23 Nov 2026 21:39:40 +0200
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
Subject: Re: [PATCH RESEND v4 07/20] arm64: dts: qcom: sm8150: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <itpvl7qrxxa3ccj6e4q5uaveerqcitp4frv4gmtlxj4y4lxv2q@4tk4mzd5ieim>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-7-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-7-be30526391d9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b049681 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=fpZYgbz1ZAxLTqytCXoA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ADhtH-RZSdD0Rq5uGULb5jxLIvp0OAvb
X-Proofpoint-GUID: ADhtH-RZSdD0Rq5uGULb5jxLIvp0OAvb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX+PIQZ/cfvYWo
 xIitSJpG6wIL2AsUf4jm89LUhlmHE3Tppv0adJp5Mf8BRA30USPWoR5rdjwASksCwyuSdGyBhvl
 zC91nVcCDH1EplbEdZd+33G9Nyec8cA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX7YY73BE1QMx2
 sBbC/DbbkvHVs62T7An3pmBCW9CvaMkfqPjYwptGsefYPkOh1nXzMP0I8Nr3kQg5i41U9v2Ga0r
 KOlz2YHUGrqEwKxvfnOljJUJ2iMOLvyOiDkFOUGUbwBS70RxGc21tAlDmEALXpoWybusLzGZcb3
 8QYeW3RSW1nyDZuqZLvx3jVyV9S/8j/EDADhAu0x/SFog72crUOHBX44cSIsS0lbn4aurnHD3dY
 Z7nRXWvkt+vAMBWBjNHX3HpCY2fQjx4B9WNOZd0iGo8naOLzNY9J0dalK3lgjeDxLZJ4M9+6+Oq
 4cUbyudGzOtLgWNlctrHFGMqzNV4oRQpu0UruL2QhCu/oS4cOKexjqadaLfmGou2DtAW8pLPKNZ
 QrzjZddMxaPLMkcTGxwgteLlBSJ434u1/1J+E5VDzt8NYXuFmxCcyh9gB+E3rXeFOcVsxjF17vt
 Z5Nn/35Ysov/Bwi9kVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:38, Bibek Kumar Patro wrote:
> On SM8150 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
