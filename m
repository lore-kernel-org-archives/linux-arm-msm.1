Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C250A4848BB
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658096; cv=none; b=ikqp0LCDS+IuJuE3jFEh3R47PRMa7KscokSqNCXGCE6jxWmnR0FmlGospZNOdIUsZJyqdSeB1gb73EYUYPN1OBV6+FyS05k+ou3q55MsVOuKB5QHk0wRHPkElTWq2utDz0t4KEwWflNyX1hviE+cC7iVfn4PtKuCEgFHUpbEkZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658096; c=relaxed/simple;
	bh=o6usTF1cUqrcLTldjDsw7thVeXzJFAV5ZRdoFq7CFPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3qaX4dTLfbsSa/HRSbE6k+/Ol91e/Rzfm3B0kPVwU9YghqwyWVlDAclQb4HQh9UYiHQawpO3QfeLxbjbg0ln9bzDGmA4ausOIpe6juhzcllF9a+jKlZ3v5X5xIqU9VVRRLJSAYrQv6R9uIPZDpPTuAGPQmfroq/VwgzbbJ0KH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J/kZKm9I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WyzNYYMF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J/kZKm9I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WyzNYYMF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDj2Tw2087603
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GjrcoUvvTRR8V2GjuvP2w4bl
	COCAR9ShGqbE3Pn80+U=; b=J/kZKm9Iht2olj0pqweHJ6QAqKiPdMJIm1mTX+wJ
	P4WARLi8PvC1BYZhPxmXX4OPy6b6klnV4K66vSkqF/SoBw53lJNWM/6+9aHAMxRO
	12FAscfIU6Trn8h260bcfDc2hV8SRVPcL0ki6OHO2xqOZnKUPzePlit8GuATfQkQ
	zYIds2b3ytsArH8/SoaMsv3UzKxjEbzZdY7uxuE1w5bopeURpwBKjr6En0V/YiCJ
	ep3W3O19hnR3+R5gQKL7yKv3D06kkdcs7wDX/0tTLeG7RBkIpsxfnAw4rJpfPXAw
	jZiBU/YGc+VQBknykP7HEPZSYp2Go0U12MlVka4T8AyUqA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfu40xu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:14:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5328827bb8dso18760711cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658080; x=1790262880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GjrcoUvvTRR8V2GjuvP2w4blCOCAR9ShGqbE3Pn80+U=;
        b=WyzNYYMF1FrGtEsnLzxpTnFMfsYpKN9vVtDlOr7FNwOE8l1jVjrT32efF3ZYYhqtIj
         KHO6K78Wa33ZH+ibEpQEF5io7gBEc6fTj1nSc+WT5gkpSxR1W9xRnjOooFUJcQsn86PM
         wm8zkYrIXt7fC4dZ5BPpihoIn+nM/W5JDPn3h+rc8FUZFTAAm/SA0jBClXJOmMpnQpgG
         SWKZuSNzkZ9asbJpywLsW60ZaUEmeL/aapOzClgF9490fnOxTbWWW13+zWo1Wo7uPc8c
         fwLarh/a8kaMf/Z2EuwqUhSQgIp0LuaVL2fHKYWC4Je5mBA9o9w3DwzlLEo77Kqcicxz
         UHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658080; x=1790262880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjrcoUvvTRR8V2GjuvP2w4blCOCAR9ShGqbE3Pn80+U=;
        b=O85EieiLeRfBUF1L4Mw9aNvUFclvX2kff2mZe07zjoonu3b+50Ib1qeSQ3Lcroiy9P
         mXU2mU+/ttHQ6Cb2E+ZWU7i2X9n8bTgeoXWGSnbpv8ZOwhWwBos5YBYpFQnk5B2TosmP
         bq+aoFGqZ1S7z7wpS39764esf8KK0ao2PWQ8NJoYj8oANU3ijr1zjwzpYbaUPPFZ8uqA
         aSXCXTbevRTjKxVTeBDHbQMYDfjsyDpsShcQm7vzUL3dxJdaIhWPr0tJ7IPBOZporDol
         bvKpVL57qoKnk8SAM+Y7aHTeyylYfAgFw0mgXeG2D7tnYJFsjaiF2MaPbeb+zGMDmLVG
         GQ1w==
X-Forwarded-Encrypted: i=1; AKwUvBwr5Z1Oq/QwF4n/W1+rZ7u0kVPpOWov/9a7iJPD2eOXXyCph2ti2gof574aF5yKblgsCQs+U77q/lBLkNlb@vger.kernel.org
X-Gm-Message-State: AFuF++kBx4waKqK+i89xgJu0m317+qgC17uxlZG1h3i41dA7SSl2kK5X
	ohxKRE1sDqNFtB8dBHZ1Fd4deGlcSmaPodMD1jVlbEtGIw9Mpcs3LM5mL4UJwHaOvfGQGKARhC4
	SPCqzowvHnQVgJzHCsVYRLhCcvP2wr7pzDZVyUUhsuqRuTOTEzKYHONwBYjht3xfUxi5b
X-Gm-Gg: AYBFou3yoixNz0+UaBjYdZA5T5UTpQ0SOK1BL2HUIWCboLXYuXoHHhWkhmr+Brw8olI
	fM6fWi3pxOCxQ4gbCpWDtB9Bi3yQ07fc8/vFmVcfwXypaBPYKXFht3uNKH7eD00y6uChrDaqZlL
	KuRfJ5mO6DUpjlwii/2me8wV2ut6a307Ja1jmkoZv9u6rveT7ROJA0VlKAUwtOHHc47cmh42LCj
	UTJ/yhww3wDqbwyf8GsNhcLTjtmcryaqikWeggd5G1H3gVKnPx1Ra5tl9M0VMugbDLpwIllGvQy
	6YZCAoirpWNR+BKce51/5hkPhlHS7k7ENEafcICVFnBKbNTaRePSXMQ0ctpvWlnqWcAMSx9huJ4
	D38fLkrLHL1/aX2k=
X-Received: by 2002:ac8:7c4d:0:b0:532:9adc:63b1 with SMTP id d75a77b69052e-5329adc71e4mr10865311cf.66.1789658079829;
        Thu, 17 Sep 2026 08:14:39 -0700 (PDT)
X-Received: by 2002:ac8:7c4d:0:b0:532:9adc:63b1 with SMTP id d75a77b69052e-5329adc71e4mr10864741cf.66.1789658079232;
        Thu, 17 Sep 2026 08:14:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa7dsm16206450f8f.8.2026.09.17.08.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:14:38 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:14:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/15] arm64: dts: qcom: talos: Move PCIe phy and
 GPIOs to root port node
Message-ID: <lr6wb4f37c775a36xrbgpg232lyjdrni5tz2trdsitgfihchoo@r6u3kgtw5zay>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-11-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-11-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-GUID: qPpAsbtDyB78D1aw6j1Wnpez1JBAg-H8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX0oUM93VxKdxX
 koaJ+FMoTPAW5GkJUODMx3ShA8botKCaym3bz0nKy1rK6Z5SWCsMnCBxHrDsyTP7qUSpjwQbPyd
 Qigpi0oky6sav5IsZ0yb+vUg8TmvYSw=
X-Proofpoint-ORIG-GUID: qPpAsbtDyB78D1aw6j1Wnpez1JBAg-H8
X-Authority-Analysis: v=2.4 cv=LbipeTfi c=1 sm=1 tr=0 ts=6aac03e0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfXzFpeZfGexz8a
 FUsCzH5HXSyIi1qYcEXN0k0bOgNAMu1nXcOXp14eHeWXsvWwQ5F3hheuBhQjj5GaOxWtNcuCnBZ
 8l2DlwheXX9F7n5QkAQEFk19TJ06rOLOs5k8C3qaMhnxqe01gc+ux18T6RWhCcxrAqwpgejt3cw
 BLKMb7GSTegCw+zeAbILJmHvWQYDqaSJi6XeTEGzSZwjhIWmf4BP/JrSnn9iimGEad1KJ1pwyy0
 DZx2e+H5pVvPHWosxX67FgaD9QaG4g+mxYOcUdps7GWCa39uKYdveAPy34zOVTiB4p9eYtZbMaP
 ptCAy010ha3B+SIR1oTsW7HQhYdESGsiOO05JjsjyJuK4m2a10L+Hm3fOxLBH26varxLGLXXLtx
 4Cp0aqsecDrjF7UlRUBTqgHh0y/g743AhWtCpuSvg7C9Gd9r1mxxeWsGX6iO/eIJmrH+NATrd4m
 xSkxugNZvW94xodE7aQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170216

On 26-09-17 17:55:25, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys from the controller to pcie_port0, and
> move perst-gpios/wake-gpios from the &pcie controller overrides to the
> &pcie_port0 node in the board files, renaming perst-gpios to reset-gpios
> to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
