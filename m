Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDFF48EBF6
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992746; cv=none; b=MLvc1TUX5/H9+JfwTs9lPfHbqzC2E+Tb9EsphWheOxcA4Jm5G7HFRLuwelo8bSNmRswe7P+p17e90VxWekBUAbUnQNlQm5IhM9/gFLslhcwnbBO+B1cIWNJAiSds9LJs2rklSGPsnPL8n2UaEFYJYzQBjSN/Ynnl/XVEYC6PxG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992746; c=relaxed/simple;
	bh=C5CqAbIBYojRahKDMYFkV5V+YuwntGhRs70Hkua634w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djB5wQ3bveIsWRDCPC02/3XqPvlV5AOmaXFmFkb0+puNfCKVSEwANiVvbaje6JI0sxhOIchVLyAjTnKD5tJrqPhgo59YZcGYy5iXau4nBo8+s6jGvkjdpbmwBMUiKZKY/K2VlInVvSpC7OGzh3v1LmvMwZ1VzpIUhCUrc4wo7BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZhaTLzjQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Re6uaI/l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZhaTLzjQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Re6uaI/l"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdx4J1563473
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p049Drg8l5sadIccCCFWkY6i
	QG1vQj2D0+87Sxiwffw=; b=ZhaTLzjQpE9uwnA8Bn3WwYs/Uh4o+nbcYbN/mVd2
	dabpaCHCGZLEpBU8S59sGrtOVR1wGhcQat9sJJU5WFjT6fUrDVOmHkJg25jUODtF
	rIZf2LlUWBgg3mxhH8x9uBXh6J9/vM07y8Tonf2fmqprCaqgiEQuT2LsTt2qhs+p
	Ld741EiZAEoyX2VpW0eqm9zlD8IHWTkwmGt3I/v/rQ4kTSHlPXPVTQlBvfDmFuF8
	axdEp+MeClvc2k7BmGxlXWeEIhh91WXZ8pKnSFSaG3YP71TqavxsbUCosUbZKpVJ
	B7DbYpnHb9zFWHuIbuzN12XFX2HtXZmalJiQXxiVRibcZQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw16vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:12:23 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fb9f59781so3039377137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992742; x=1790597542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p049Drg8l5sadIccCCFWkY6iQG1vQj2D0+87Sxiwffw=;
        b=Re6uaI/lmOCNnMpS+40sqH3OpVd+n72A1ToZP3aanD4MYUjqK//w3sUeS9HmiytWKN
         RuLMgVGSn/vioAs3+1xerUyRDqMZlBBLaPRyJ0ofus0UIbz+MocK/9F01+bQypSfNSF8
         aQikgq239dqHLfIGLAajGnwT2kmfKLgbmnPG7dn0vQ/tp6pO/qDE8ywbnYMj+iDECPP9
         WKz243W4Lw5gD1v85hu9W676Panm5O17If8hwq4ko7GVdWZWg3j8BzI9oTvvN/kivIyO
         gXKqVKOtTh52dZjGEGm9U4oAPjQFjMqJQkOhgSy+qlxll5cGke/AVG2O0Arx1LL7f7ak
         VpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992742; x=1790597542;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p049Drg8l5sadIccCCFWkY6iQG1vQj2D0+87Sxiwffw=;
        b=syg3V/83yu16V/klufrcCFmbCQFnvqW21O5fy383VZVqE9vv0gfbIIc4DktZaz256m
         D9sA1IkhjITBSD0xDmdr6efFueXK/X3plD3kakXK5s71RyeawO1NnfPzeBEn70SB6v04
         jCAefQPHJDUgBmLPh94KS1MPMwf9IKHUfzAgpG6eBk/Xzx1EbXYDbyY2SsP6UqFvrRZz
         IWdPsdq45tZcoWJT0bV6R7B571pJp2QUfgdmdDq+DnThiWzP7wq6Dy5MfosFcfz2itsg
         msxRLa3LWPkxGA9igRdjRJ8X9gBosuekERIkulQFn8ZKi6HZqab17SltfutMDNKQUlv/
         4AaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvRgfK/hilKY+cVWLmDA3eI/bpxbsa7SNUBmNrw6Xmdkh0ZKmCzkhFrTZBICW/PVqPkQ84t1ClRn9rAWuB@vger.kernel.org
X-Gm-Message-State: AFuF++kn3xz8KXwUcNHkOF1IgOzrq5h9h2vfkUp7VBjUxdDE5ChgMMnx
	5xjQZLnLZ2zWwYUXx2pUYqoZBjJwyi7FDegMFozaEZzWu4aYdGnGikcNV5bzAGxRmzeWczN8CcB
	fEpAkPu3rFzfVX86psh4K8eytmx5GSTjJ4fNp+ok7oN+KeW68HY9qtTwnpQbqnhaMReuQ
X-Gm-Gg: AYBFou10FhOCtUH7husZXbsL9S6prJ5fTmPUV5xjvqsQ1XMsDT5mTw7EAWKvQmtSdIq
	rnT/IqZiaeJyN7Ke/NzCog/LF7CCDyT4NtdRa09Zf0FRlFJyp1h0emNqrRz6u0gVsBQ9oBUJB54
	sOIlnRTj8beU01ziQn1dXIWBpO5bi1fllL9vU+DawtTIvbabo4uEdsAmxuSXxwtUtpBk8UCjLma
	HwgXJY7UH+rLGUoLK6Y62QcW/oLd0Ycyph1g7e/4oc6//PYHhxyysXCF/x1gy/U8RZMthFOioai
	k6h0QiqPp3VNUP6dDkNoXentaFY1yboXVy9cl6den30xtHHn6mvyTTbCGJhvaNOMaFP+iix3nXR
	qB3Okx3i3iUqtCA==
X-Received: by 2002:a05:6102:14a8:b0:7a7:1db6:c75f with SMTP id ada2fe7eead31-7a71db70ec9mr2160542137.17.1789992742324;
        Mon, 21 Sep 2026 05:12:22 -0700 (PDT)
X-Received: by 2002:a05:6102:14a8:b0:7a7:1db6:c75f with SMTP id ada2fe7eead31-7a71db70ec9mr2160481137.17.1789992741775;
        Mon, 21 Sep 2026 05:12:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd103325sm263684855e9.9.2026.09.21.05.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:12:20 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:12:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: use assign_bit() where applicable
Message-ID: <3nr3krue7zqpguca4yhm7rgxpnfw3vtamlkj2caxrmutatrytg@uosrsfrui4ll>
References: <20260918141833.3023124-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918141833.3023124-1-peng.fan@oss.nxp.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NiBTYWx0ZWRfX69trPj/y3cVr
 LZrHMwrvYIMmezXqz8EUmsNHAo6soIAVK7autzKUKxO6Go0lhM0Ln1/9u0+0HK0AgAp/1k71Dcf
 /PzylVZrb5sZTY07vdkZcMBvrmKxFhVvSJeRp6cEH2mMbDjmMr3Roy/qibZ/YHMEa6KwX6EwUKe
 WXwAvRF1UyMoDmD4EIIgiktVvlklJlCTLjm08/NPOoZGWADut12UNGIgUenwR4jJ7Q9XMbxHA4a
 V3q+HFn9JCgd1U5yUaXG0mlYsl+sTc5BhglZh4x+goijBSaSkNRFiw8nNJcVdT3VwhKAxXZV2IZ
 ysU9R4auM7HVGcb6520uMF1yD10p166mMJE5pMenHs8Uw73o25+PnulpDpiZd1P/0n80yqhVe+i
 K3i/+cWeNRB+aZHryB61ZHoxWN36s1sIZzXina7PO3uk61rKhpNBDfsOfoaN7Z0O6RCE/5QELWr
 GZwbAI8bvK1i5Qb/Blw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NiBTYWx0ZWRfX2jzoUH5OBfsz
 8xyVhxGCc8MMC+L/jwQViaCQKkMztV7hBzcYtzTj5wjSkhVse6X3lsbzeGbLzU0fU3vaTChcXHo
 SR/gYPxCwPCztYCT2tUuSiHS+v0Ivek=
X-Proofpoint-ORIG-GUID: -tOpy-i9cscck69Rzb0cI4RpiuHxvZqs
X-Proofpoint-GUID: -tOpy-i9cscck69Rzb0cI4RpiuHxvZqs
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab11f27 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=nSpsjYtsPra2AegJnUsA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210176

On 26-09-18 22:18:32, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.
> 
> Done with Coccinelle semantic patch:
>     // set_bit -> clear_bit => assign_bit
> 
>     @@
>     expression cond, bit, addr;
>     @@
> 
>     -if (cond)
>     -        set_bit(bit, addr);
>     -else
>     -        clear_bit(bit, addr);
>     +assign_bit(bit, addr, cond);
> 
>     // clear_bit -> set_bit => assign_bit
> 
>     @@
>     expression cond, bit, addr;
>     @@
> 
>     -if (cond)
>     -        clear_bit(bit, addr);
>     -else
>     -        set_bit(bit, addr);
>     +assign_bit(bit, addr, !cond);
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
