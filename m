Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100056;
	b=HXFnzS+D9cGObM/LhkEhH+peWqQCuddA23/FK3kUNKUjfBsrqhIafDvbT/ubJNnjxfg6
	 goFhw0fMMo160/diTqZ4JCEFadxFavdmohGKu7lB9+VbmcAC9sc9su4TCAW1D/WLeDodm
	 rmPTlGBLOfXKJKFPuzwiKAeiVffOx+86F6+aT9J0ICjGuRoU4Sb6wmgGTgvyHVa3SXciw
	 KJWLJ0mmpVZDDz56ZaEKTwerymHxHOjlqtBWUul6Sf3NZaucMr+WBgeL/VwERGO+U1kQG
	 WZg4L375/k0v4AE2MqgWrMR8tLt7zYHVYT7G3t7KMyIpVjIq6luQq9oKMEhP0S81rwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100056;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1kMGzQ7umpbZhrvqiHmJPKy9EhW/4CQ2ThLKi6xfv20=;
	b=Ec+v8+ausR0zObr+HJnQZp0uj76m9C854dAUSGoo6J3DixSi/k4LAGgBplBwGlSdT9u3
	 OR5nx5Xpb6wnVdZTFhi47Y2ifyZ9KHQ7i+7/RX9lAqcEFr4Mc2gF/mxXkCBPn5bu8oK4Y
	 EG69cX7GHzB+rnp4A6JPpRgsBOrwZXfsv4ydPux+pusb8cSZdrqtrp4q2b0thiGhR5h9c
	 cvnYsVFayj5ZiDPc4kbwtTfvZYc1do8VsNijqUDre2Bo/Q2VNbmmRvoll6sK67VOrunRD
	 9KtQNlrJQbX1wIJZ1130dRsjiAwRVbhPB24S6PmZxM/TR1NQN91gMVqAImBfxNHLEsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GydBJZbE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Tl/4yDjf";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9FC606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B9FC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GydBJZbE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tl/4yDjf
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3mw432370
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1kMGzQ7umpbZhrvqiHmJPKy9EhW/4CQ2ThLKi6xfv20=; b=GydBJZbEq4BUfEnm
	PuKstUjmpe7qii4HSSwD6luUGWze4l/IyQfFwPDhUncUKJNQfxWEnf4MjtAD2mGq
	Vhc4xGQetu0KXr/r2fNtgXSZ6WdQIeLVP7QvJo07XVqelpC229FZjBmMohnN00XQ
	umd3jtEIh4/DNYTOHPZpazWXc+C0+1c+nEL2W/llxcgsDyvy2hov77yHft1OWkLm
	RQUuZW7lxN7TdlT7uyOgvaUMNMa3KlBviM0yIUzGuKTfNMz/bfe/ANM0Fn5MHrdo
	oTautnUOF84EuKPtJwFZWHrGvYkqD9CLKtPmPCICvxYonzX7YPl+b/sSWxO4Vitm
	9fRDOQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54kgn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:20:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5356c6d98cbso13868771cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100055; x=1793704855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1kMGzQ7umpbZhrvqiHmJPKy9EhW/4CQ2ThLKi6xfv20=;
        b=Tl/4yDjfmXcny65lIZOdXN8BgIBUx1jDTPqfcnOx8jGk8W+prsnC+tYeyOmaQ2mztj
         56CS/BVT2DL/uU+FirRzGE8+fvsvumUnK76lJVPsB8ppoVRqX+sWHFlARscpJGQ49X8G
         HyLHlwwxY3x/3kqdDzHHOF7W99CBJ7MiBG3PoQG3SeNpL/FzpqC1PA7AfHHw2cDbd03L
         /xdQz6tpdAK5fVfq1o/JwP81DJivX7LK2a9QH5qL3HNnJOjXeFodt0P1JkYT+smvLINw
         AU/GaIqXWBEUY3wreuqImhJm7ecVdBc/QyqhkqcYGyuhYBO31dod7sNv3PAffg7JT2dp
         Oy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100055; x=1793704855;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kMGzQ7umpbZhrvqiHmJPKy9EhW/4CQ2ThLKi6xfv20=;
        b=1pUxcCdzaj7BljPMXG9zdBVjAShhmHtmau7izpF0vCKV0k/2BQtyzvuaJ7ZfRbyidS
         DPwqTu2+WlU18eZwcunAgeE+9jVeBbFB1oPPwhHiDNnXM6ahpa99DSuDva0QQEQYGjdi
         0pK6Ee7Gb/V625tubGL//9Lo84rQquCiZoblyghK18pC7rXDDBSAPr6Z5krDpWOcm47d
         /Lq/HEdQbbPtZNso0l/eVRIji4QdnaM9GKtZ7gX9GdTYDDdBHTwPLzFM8sg+vPrncJmD
         mOYh3PN8k0jBT+g8PwMkkYa2xmWmyDrFaeZLFDpLqkvCphIh7OJVDU5zsVvsylNOOpLt
         icWw==
X-Forwarded-Encrypted: i=1; AKwUvBwWjytcO0CtxKGgwUnfkx9/+cF4Q+KjiRsCinYkDRTDOZWPOpYnc6sJjXmEYWf6RT9QENtnV/6zLgsMSXRj@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3IAzBjkXWkeJ3MBMU+DaFY5fIs/OWUXujnmgT5V13UoLcAw5M
	QYsURjY1u5gzWpn+ZdhTGoA5uDRWvXHbjydm81d7ZORlBs6dgtn/LMjYko2ddtsL/wS4TPY/jY1
	fUcAStLP5OGFim9gMr0X/uvisx+2bbSoIHecMysO9soJjFomOoxZ1k4XvAEGDzwWItEJz
X-Gm-Gg: AYBFou2IZllt77IHERQiuzdFd1I++6z5kFAx6lDCX7mHR9wECo00GFwPVXPgy4gHk0q
	jW2rcDIsV629c+r3h/B/C6XXQpeewxH701XPTKMLEa5GS+465lsVSQvc6beHeZRsXHuFmXHckEx
	q/G3A4jTvjiU3nkY88HY1Gyt408I6k2G2rmoNDe0eRfVKx6miM46FnZiOIjYbyAjhbg8zeeAfrW
	PaCVB13nlLvauTNWLBTtBbZ/jDjkOXTNrgAOCZ+LargM3sgrClj/GPDr1B26Ajf/otguT3/73BJ
	TIhRD3UTrr3hjUn/aiOdE5CtZ1OjuF8YQbf+CTP0vTMJfWwQBgF+vezFiziZntYGuBYUvk576eB
	0M/we5gU5QVXWebtyWqKGdQ==
X-Received: by 2002:a05:620a:8a0f:b0:940:f21a:eb64 with SMTP id af79cd13be357-940f21aef09mr1114251785a.5.1793100054284;
        Tue, 27 Oct 2026 04:20:54 -0700 (PDT)
X-Received: by 2002:a05:620a:8a0f:b0:940:f21a:eb64 with SMTP id af79cd13be357-940f21aef09mr1114248285a.5.1793100053788;
        Tue, 27 Oct 2026 04:20:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b45f7e6256sm3277505a12.31.2026.10.27.04.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:20:52 -0700 (PDT)
Message-ID: <a276db23-126c-4ac5-9cd1-5e6106925660@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:20:50 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: monaco-ac-evk: Describe the PCIe M.2
 Key E connector
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20261021104709.1428234-1-wei.deng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021104709.1428234-1-wei.deng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX54ICNYPNwf7E
 ego4XJX74z84mijpq5NOLCwar7ZoqMv8IwaP1kgSnRdMhgNp/+Tt4g5hcjzRXQjJBgVJDM0+LSF
 sMQQWRf47XfTbuMOEjdqWeh40urZG6Y=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae08917 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1tuRgrbA9oXq7jUc8RoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: AcdkI5vYzrBu-xha2uhG1wn-jHApbPnm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX9E11GunDIbIM
 Qh7OfdLTxF+b0prSs5VrsC+ebFErn7f1ADOryMGz/9Jt0ETRrgAF5mU4/KZz2DmLg73Rgnp/FVX
 VlSdJeHOhWDedol+7DTNaB2paKcsx3GQYo6xO7SOpbBvVishl+jjM/t53CQywoZARZKx7ExRG2C
 5H7GRtUlsOqvJ/clcbG3ivVktkWhZWqfT3GnAgWlC8QTmcfd/9yJG/h+c+LszjPVSGpNc8i0MrE
 VntnluzXaqCqY8yKMRK0PX2VYcVdUFou5pgDZyC9qyl/oHjeWxXOOXzdNP7OgbGOyuWuXyTBAe2
 cVF3c1sp0KZGIZ74X/MoTg0ZVy2k2XqGgDGbJiRKIjsw39SrHLhxN4GyiXvZuraU8XdoXJ/2yXY
 Xt2ZpxXFh4vD66hC8IN7KunY0EH5sHPZEP8any1w3aROC3P/2XZP816iN5DJGRhZ6zmPrgqm1hy
 GfiVDWlsbIfL51nrNcg==
X-Proofpoint-GUID: AcdkI5vYzrBu-xha2uhG1wn-jHApbPnm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

On 10/21/26 12:47 PM, Wei Deng wrote:
> The Monaco AC EVK has a PCIe M.2 Mechanical Key E connector to
> connect wireless connectivity cards over PCIe and UART interfaces. Hence,
> describe the connector node and link it with the PCIe 0 Root Port and
> UART2 nodes through graph port/endpoint.
> 
> The port/endpoint nodes are defined inline in the board file rather
> than as empty anchor nodes in the SoC DTSI, so that
> of_graph_is_present() only returns true for boards that have an M.2
> Key E connector present, preventing unintended pwrseq probe on boards
> with soldered wireless chips (e.g. qcs8300-ride).
> 
> The connector's 3.3V supply is described as a fixed always-on regulator
> (vreg_wcn_3p3), which is required by the pcie-m2-e-connector binding.
> 
> Also add the serial1 = &uart2 alias, which is required for the
> Bluetooth serdev device to be enumerated on the UART2 interface.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
