Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407471;
	b=qDJerwES+Ml5JKYBD0vJEcHpO1FCXh7e/dkd+5m/8MfS5MUX7fMkcvfxoGt+xtuXMO5d
	 P7277DgIMUuz5Zy8JhNevo4a4sJ99tzxQ3jVE5quRT+V0hGMBE0hVx1gFf+Xau6j2gv41
	 GJJMaucR8ihnE4ZtjaXHnp0wXHcyrgNVqSfxwVBzBkJRqLX2/jl+ZYD/Ok3rYa3zJYzTB
	 PBZ684Q5hYxJsbrKaSw22/JdLE7Gqi6r6Jgp/3+QlW0bUJq15lZGIqVGf5LRShgb55csN
	 e0eOsR72P2ZvoN7n3vlcx1QQf48XNU5YxhlZP1ePgpzATmv/L0VrviXt3aZjwOZMweQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EN+WAVgkwiDEL7XX6X4DT1VgY5ErtLa0IoCAAHBwQOI=;
	b=ZohaAZn0gRuTiq6gt9af2K78redJ7l0S/YEVljPF/ucr5ex4kW8sw4YP9rx3lotgRMtp
	 4nlc42xhfD0rf8fOmmR23c2yOv+IqdmZrg3ofmW8Dum0MYtUaRVuiUFdXG7ic1JjCdxLY
	 cvD9SuwvFl1QhxshVYxJSbjirdlJThcP/0lhfTEVerQyITEC2OYcxjwRIk3NmnccNodPW
	 9gAZrHSSpez4jDpFCzkP5+zPqC83AzWpMxHtqbx+JX9cxoR9qVumZ3fhV76PTochS1LpF
	 4HLJbDJQRcBKZ5sN2b42zoTRDANX5Q/sSDJFZfJOlhbo9Wg29P7V1fYuNv61l9psvBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MGjO7NAW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YM+W7fW7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63531606A332
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63531606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MGjO7NAW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YM+W7fW7
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEHpAG1471312
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EN+WAVgkwiDEL7XX6X4DT1Vg
	Y5ErtLa0IoCAAHBwQOI=; b=MGjO7NAWXsm5REpaJFCiUmZCvAi9qTiRnAr8Kq86
	AVPhiEtdmyqSoNbuDeMZlrhyVPlwHdQAdjWSC+w9sxdD7esdjBb8iM1bPgZWC8qZ
	hyjrDjJVLrnGpupUahioTlrJm9CkKvSwOhRVsDYYk2ecMmZsNbQ3tevH1BOfUKmO
	IMzeMp1QY8UESmTdYHXn2R7qdjiZjNMrXcPM4Rx6BA+809hJRgU4W7tmp8A4MU9z
	ayKtNV+SPc6XcLi0Wh0Xs4pfN3bYImTHy/kGNYC/PpcCxmmyeZjZqvuF+dgxIAAA
	iwKPNE0pNrhqTGseDWxKfD5+B5q7ADtHGjfIcadDTeLbdA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m0a9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:31:10 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eac74b0596so2713471e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 06:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794407470; x=1795012270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EN+WAVgkwiDEL7XX6X4DT1VgY5ErtLa0IoCAAHBwQOI=;
        b=YM+W7fW7tnBVR9LtdCWKFpn6gDQO2+xL8F2TrFdx5XaPG50hxIACci24mnkf9Vsiyc
         o3ZhAMZYQY19xYIdMh52gyVgg/SLxDg/O50Kc1s7h8llUzsg4nxH371JMc4rvbZOb20S
         oZWgQKCepwXHTPtQ5hwjj1AYlV4z7Rea84rOSMBn0DrkOrOk5iWVwmcNN4amkvrH9DN3
         NdeR16mzZ654zt2HdXPW+5F+5eIbp/JTN/yMguzk8VyYqCyqyR2pgqM/j3cScFZkE8cB
         EWcOyrIbRwy3KS+nbp/Je224RQsfQxCzPu3Hv1nMiQkAKjAwqZFkZf+zA7pbXreQQQHs
         707w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407470; x=1795012270;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EN+WAVgkwiDEL7XX6X4DT1VgY5ErtLa0IoCAAHBwQOI=;
        b=rL6uGyTeap03dFfRC6gnNtZQzWLUGZYRfSSMljODEVQC3Ipvb1JaNOnOxFoTWB1Y33
         G28WnsmAlnHunbpGNNZIfRWA9Ka+YzIVLm3oZ8ajAsg/vB0xpCMQNmpc1YV02/DE3+x1
         fYjziyYYL1cGNLf+pEYnCNl6W3PDiF6aFwq4KbF7bVDP17W9IBfqDWtbQnqpPiChZAgW
         GioILwCnP1AQ8bfyE+7L3x7z6jwTz6ctf4mA1obseXN14Egoz9Ao/w0ZMD6ahjnJxJUA
         Wr7vLCExbGLEbYudvGyBb8CbnBkkVFVRc7ujzl2FvqwsuO1hNQbUytcwN3xuoCJ4J+FY
         Kq+g==
X-Forwarded-Encrypted: i=1; AL+hErGoKjye7Uc406o+0qJnW81bnTGE6N++kuLa/WGW/O1Dr9Hc+0tueCSZIh6BFKnxPgpnnNQSH1cslXBQDmj0@vger.kernel.org
X-Gm-Message-State: APuU4Z8U3U2l1cDfC0E5F8fOXN5GxJ/ThQskrrEVe7dGPLLGJVqvrCSq
	cZaMAtFtv1MB7OeFTdgWEgfRuwKOv4oSv28loSYI5RL2a2qFDl0WPPWHGeJZBZOBhAehsuk7guA
	ljG9ZW+iLNzI4uHtwY+vrtX/ghCm8IY2whuBHQFmMekqbMAFqMyB2n/nkmZKGQALVH3pK
X-Gm-Gg: AYBFou0t+P6Pggbo6pCOk2YEWUv1s2WRYZoP7zQSmUgrW5rH3pHEr1Zr5Etq0VVf1hk
	BuSHS/XL6nb+IVTfnI4DpL8bi+//dNEMc39uiE48HVMw3b9qdNOLaQfOY+2AhOZZDK/xJQ7G4Fi
	OXSdk9YdmXZXT8WbdTPfsFC5Nt8mn7vpo9SCy5+ubxag+xw71/k9dyCi3YKpiNE0q7YCHbWjAhZ
	BI35OmY+yRIjX0OBNY+xsAGVxQq6GPXnkPvBFQrbZjnZzDr/FBoUWe8FoZibs/celi6LwR6upRm
	AZsPq7xTPjj0X1/9JnFp8mvngVoKD3ClRof4/TN6FNky5akR1kzbQh3SsK7Aisd+3h8noTnFr2X
	wRG1vMVuDcg7PkqpSmtf+mwCnLMDYz2ogPxjIeKE05YPMb8ZKN3NTxd8hhnH31YSa
X-Received: by 2002:a05:6122:512:b0:5ea:e052:2ef0 with SMTP id 71dfb90a1353d-5ee1c3ff521mr824881e0c.9.1794407469339;
        Wed, 11 Nov 2026 06:31:09 -0800 (PST)
X-Received: by 2002:a05:6122:512:b0:5ea:e052:2ef0 with SMTP id 71dfb90a1353d-5ee1c3ff521mr824825e0c.9.1794407468682;
        Wed, 11 Nov 2026 06:31:08 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e57504sm54594105e9.2.2026.11.11.06.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:31:07 -0800 (PST)
Date: Wed, 11 Nov 2026 16:31:05 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladyslav Tymoshchuk <tvlad744@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-sm8750: Use retention for USB power
 domains
Message-ID: <gncowr77bzqv7mnshfpqv5rkvkjeyc5if7zfuf2xtqbxakppi7@xvefvpjdc2et>
References: <20261110213346.1359-1-tvlad744@gmail.com>
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
In-Reply-To: <20261110213346.1359-1-tvlad744@gmail.com>
X-Proofpoint-ORIG-GUID: eMsM89TV8VHEofv_r6b4HVNRkGj7ya-M
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af47c2e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=F04PIRqRD5HbMnb_lPAA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: eMsM89TV8VHEofv_r6b4HVNRkGj7ya-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX0IVcQNDITVxS
 b+fc/p73x+t8adTEBLeGvCSL6xueOM7+14GcpKG3G+12NqYoKikTMTWEa1EO6NWygvhpit3nR0D
 W3T3Xka7XfGMsf0koNy6AJj/itNhPKYBlhFfBCtQzc/2u2lOOBZ48OaGTzqF7Zo8f+fXwDBKv3M
 QmGUAcTJ+oeu/E7f1gp1vi3eHgbfTEegcktvK4tmmoh3kiuNk5EV0P1R3dB8Dy3oHE1IEdzSdY1
 4PFNazaMdJqVO7RjGONc2b/+OhzjCdKt9ran6IxZqTX5//6l90tnr/D1rP5KIc614jv0j3xSwNp
 M0CK6fEt4wKDyd+WSXbsrF2cfEjm95aolBHwlYpHdHOBe3ccJ6eCdOLy69WnFv+pqXm/5MLJxuL
 /U8H+dkBidjtJp1ODcka7lUQnsvSYTen+svXzfV2/wmAYpFIeRHWtYokmnx4fWk+9rKdLhZDsQ2
 s/ZwFcPAkrWDEiVO43Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfXwlsAw0DPZIcm
 3RnIniJjZJsQcQZ+s7xNB4elMjGTy6xiHl/KzDhpr8HuPrn7gG9RADYLzSOhBvhwvRszasW9W7p
 65uXyPCX04Yb5fHjd94BzBrYbCKh/Wc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

On 26-11-10 23:33:46, Vladyslav Tymoshchuk wrote:
> The USB controller does not expect to lose its state in system suspend.
> The controller node is a wakeup source, so in host mode dwc3 keeps the
> core initialized across suspend, while genpd still powers the USB GDSCs
> off. With a USB stick on the port, the xHCI comes back from s2idle with
> an SMMU fault and is given up:
> 
>   arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x669fd3200, fsynr=0x370011, cbfrsynra=0x40, cb=5
>   xhci-hcd xhci-hcd.3.auto: WARNING: Host System Error
>   xhci-hcd xhci-hcd.3.auto: xHCI host not responding to stop endpoint command
>   xhci-hcd xhci-hcd.3.auto: xHCI host controller not responding, assume dead
>   xhci-hcd xhci-hcd.3.auto: HC died; cleaning up
> 
> After that the port is dead in device mode as well, until a reboot.
> 
> Keep the controller and PHY GDSCs in retention, as SM8650 and X1E80100
> do.
> 
> Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
> Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
