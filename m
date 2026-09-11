Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E055392807
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133701; cv=none; b=G/A5J18uTYrSyL8U1h+TGtXhS2tfWG/cBwAR9EhtWImCDrln9q3XrZZ1MQIJyPBWQUJAoAfksuLkFW1TPi0WZBTu1wJKvCOnpV452hljJox5LuhpbXAUnmJDqgrhMqKVZT7LHMWMGfQygYR51JsbyFuHk2RufQw0trxNY0qegCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133701; c=relaxed/simple;
	bh=ztJJ8z71GuGpNXypLWHAaVbZFrb5gvtjilMWS/62OAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5shFHIhxT05+y/mvt0enF048zan5zYyzafx4hUymakHaQRO+bnLc7ShLv9a7ELHkuZIBtA1LOIhUp7alqgBBc5vUnxt0vhnH6BhUtrmYoIpg1OtAWMlx1g+n1f7IYPvRLboNdm/VRPLqF3Ca8+IlxvLK82L4OWH0vqFatwm6+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0CwuEQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BVnvDLYm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0CwuEQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BVnvDLYm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCinwU328381
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rlEXIvgwRQfsHm7KtaBqwgRU
	nTtOOLNR+RQID0qlb+M=; b=b0CwuEQajB0dD0vX5AVMIENVbCA04WAMWp6Ve3DN
	mU7LG8QkJwsaoWqw/CYM1oZB2Gx9WmVEREenY6m2Vmj6k7zgncjYUlvySfSTOcMW
	IDBoDRpvRiQzlXfGzFRY6mOt9G1iskCzeSdB7jM/+8grbyro7PTkhqH1HX8Aokpb
	zN+BpOeSqbP//15I4BhRtJzawY5/g+MOzN4OyfDe/+lOp9QfCGmG7ZgJ0EYle1x6
	4T22vFumxhDUtENHdyltU9Ows0jj+PKlSdhuHq3E8UtcEwQ8DYTWU+zBdwb0H1+k
	gzn9G/RUG6st67G8U1A4yOXVr55ABerkEpClh95aJanvRg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q435nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 13:34:58 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c58ce17b04so952105e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789133698; x=1789738498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rlEXIvgwRQfsHm7KtaBqwgRUnTtOOLNR+RQID0qlb+M=;
        b=BVnvDLYmgeGrkohMSZejL0oa72qZVl/i9e6XYg355k1iLBQKBDvluBrsr55maKCw5q
         IKrO3C92R8B8gPl9LVYRElrmb9K5cejYqT5isPRVPeahIJUoztVIHU+c+W8iQgVsdpNO
         3nVdJLsnToztVjmBy4nCChaUMi5JZ6DUZI40d7UTXjDBplt++jVwpw2Rzozdjbdtw22n
         j0l/KITjUc66OhBvXOLeJo+xk2bvAo5nojDNkcrHnqVmBwTnCzbHy/08x2F2ryOsfHxi
         VfnWVH9Gclc5pkbrfHUY0yKDKPdZ/nsiPgDYxXIsiKSKfmPmmknhEf30gwHDKg59rZtL
         fQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789133698; x=1789738498;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlEXIvgwRQfsHm7KtaBqwgRUnTtOOLNR+RQID0qlb+M=;
        b=LIIXGLyG1z6JNFjczS/sXllnY1v1mBFaaRNetBF7vqJJwAw63SYrqHyCX4FYxXqKU0
         Yk92wHcJmthJ+8g+WS6fxMBxuwG11YDBR4kVojIlicxYyKWydtSrzoDiYjEvAfOAF3Ph
         V9gsCyBeTta+mwSfGNRKmEKVVPeY/yuUTwiNlECDcVRNaPVtVK26gHw7Esb+v0eUh3YD
         Kd18pUI3XR3lJ2fRrEZF2IHbSsIE/vMdVedXeM7pYYdwO1+I+n8zlZRouyGDZ4S51Jdo
         7W57Llfbuj7L3aK14cZpbfw2S1PQKpK40SBYotM4jCWFmZgJG4Ao79e+kKHklx1CgOg/
         YfBQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2H/UEwyTWaCCl+69EEwzCwYHsEjvsuchCRYCv7iPtQ+qgWF9q16+nMmHgN/feZRbhZf85Nff3zryVIhCU@vger.kernel.org
X-Gm-Message-State: AFuF++my1/WNVaERvtBzKWs0gDGWGwCxG0jJSiqjPfVBpXtNdNAdWZay
	d9J0m18dMC9OUJihRHJ4u5dmRcJqlAVh2V0DBa0Hva6OSH9fz4elA9LgYzruxD5qgKg00mMC+GI
	H6lmV0xg6ED9FG12UACr8a//MJCwlat8m7LkPDfwIiCbAnEzY+ay216fiePEQHO/6SXTv
X-Gm-Gg: AYBFou0sv71bpbatOyi/VBvFN+GFpT/AIR6csuSBuEp3nF4c+Gms/tm12p5guxRqv1O
	itXv8GCmnCHXD9p+/ShXyUpZtQ4na7ViJOYr3sGCuJ0PpicxxM8FYdqpqpQzmpfjCDzv9O4KFhZ
	ZZzstVfIY0PtoYsuyGI/FISF/xvDXEJbEDLPyS1MagtYD7b3zzl1p0TGRkYsD4jTrrqee96t8lL
	mPmX5oRY3at7qpCz6R9LTIov7O/VLmB/pnvq1ejPafVVTbmY5jDMpi7IgYjBUfGDUoFSdpE5AEO
	jb59K20EWVRtRwXMV8iFGJ3OkFybTMLd7J0ylAWfrjMzspDcIe8hoku5D4wpRhUU7Va1W/axb/i
	ZZ37bCS+vlepLuw==
X-Received: by 2002:a05:6122:c8f:b0:5c8:2852:36cc with SMTP id 71dfb90a1353d-5c846277c7dmr5049703e0c.4.1789133698202;
        Fri, 11 Sep 2026 06:34:58 -0700 (PDT)
X-Received: by 2002:a05:6122:c8f:b0:5c8:2852:36cc with SMTP id 71dfb90a1353d-5c846277c7dmr5049629e0c.4.1789133697651;
        Fri, 11 Sep 2026 06:34:57 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb357288sm6149026f8f.29.2026.09.11.06.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:34:56 -0700 (PDT)
Date: Fri, 11 Sep 2026 16:34:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add SD Card support for Shikra SoC
Message-ID: <lubx7heokegundvb5yndi5g2kaw4jol6tgegyt5qt22axf4piq@jacg3xx3ooyg>
References: <20260911093932.2376058-1-monish.chunara@oss.qualcomm.com>
 <20260911093932.2376058-2-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911093932.2376058-2-monish.chunara@oss.qualcomm.com>
X-Proofpoint-GUID: hTujEPyYjBlYM_nlWw15SQJ_1Y32yjSC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE4OSBTYWx0ZWRfXyQmio+VMt8/z
 J0yDmGTUByYSC6sFbih+cACjMoIYaTtPNMtNCzQS2rLH/bdqwulnVA5AIW6QlK2l5p1HE4YpAQW
 KAXlOB7EDr4veQnGX2jofuvAtsjAEWk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE4OSBTYWx0ZWRfX154D5yCIBOJg
 uVwv5JdmxW97jjeHQVvqe5XUX34Z6PZ2oJoAC2EQXgacmourH9ZaU5Q+bwyNTxHakCxsmhSEqBH
 xFdFz/BGxWAD/QkjbZNK/B3G/+uhIIuOY2H7SKx2g1WN1XnPVzfflg102cSMB1wdj11VGDIo7Bt
 +BChVA5J0A0PaholPtloxr1DaKo4so6pnheJ46e2wj+fXPijuTKzC6foGLZEpuu3O2E+IzTY2DK
 Gp5BJ5//hCgZTtxFPFtUxNEMgl9oRbUDAaWFEizCX3j6v71nWErl7/qZ7bDCBJTw340nVTLkuU+
 etVonKfUoHbS5EIb5u8tC8IWtAinQau1I8HOWg2xmSVtvdLaoskLd1PjXeziYnBs9Lc20sKRf3F
 xAqFHuYIdp/OA29iIvKoxv1wzVxbtCSAteQ/3tnCKU+AwX+IuPoB/8ZGNkB1UJVP73jiEXDJele
 laFqWICLIf4QA+n/uaA==
X-Proofpoint-ORIG-GUID: hTujEPyYjBlYM_nlWw15SQJ_1Y32yjSC
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa40383 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Tcdqd_mqXDpkZi4He8MA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110189

On 26-09-11 15:09:31, Monish Chunara wrote:
> Add support for SD card on Shikra SoC and enable the required pinctrl
> configurations.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
