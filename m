Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827522;
	b=VPLqljUpVAhkswzV3aks4gJTxBJH2sxdNE8DV+6IXBjkbQZwC2vBRzD8yVlBie1jRA9l
	 eioxPLYzs4Dq7878Fr4vctsOGJ4OOI0gNtCAe16VdB3BjRo12ev7GwcaoHQuEtWHdgPGQ
	 YQm0B+AMgqxT9puZ3AM8/Ff7g6bam9lrOoV9Pq7DgG7GVAqUTsbAcqmbNRIK7n77w79QA
	 kiTwFul4rUJJl0b/cUj6RCWtKc+VRbeDsRC7l/aQ80bZzT+KQgqc7jMY9DmauZXXW97md
	 c7DRyP0AYLcGL7nbv9vxWtxTGnzpnkLkt/hkWtrQTqKZ/OqXfaABTSzCU4arLomrGsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827522;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ej9jdDHgLV0e8+q224FTssM5bujI8HMl3OobzJU+HSY=;
	b=DRFQaBQJ3E8jXnWg4YjB8wDLHMJQFety87UoqyYZZIurR6KBPnAAehk1ys5aUv7qCQbe
	 MqBJInblHRU2sBUQcm6SrUf/JFOF4V1RZpU5WhnvU40BjVFuxXlxbjrNF/Obbnj+p1Sox
	 TSJMdIWPNhbAxYeVzyY7SsxKd55grS4zmuB0uLx7FrxeOsSKa+bhCFSkYq+0utIdQ+sy5
	 5R97MF+hp0Anvi3sxQEe6VFFljYmlN/pPP0AFWUFgwgnDhsehniByCImuVtAoPOI4/Z3R
	 1PsbC/8/k1HCd/8nzxkgBrO8Xnk0RIH/8k9uw4m1JohQLpAY4dGZCFBr0Fpsyg1nNQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SPbFwlNg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z7NolkKN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAD8606B199
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAAD8606B199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SPbFwlNg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z7NolkKN
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7ewqh3488772
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ej9jdDHgLV0e8+q224FTssM5bujI8HMl3OobzJU+HSY=; b=SPbFwlNgGAX1d2Ij
	jCPyY0ToQkVngHeWoqZbyO2qpTQVxLkBPqXCcL+ytwQaCeKyM2n49b/AWLvyyI3o
	7bTDPQ7MbAi654QDvRyLk/e22au21iYYwdlyo4bu1iDBpUDgvJn9YjDF+KX1dt2g
	k5X5VNeznb4+rjU86YsuRVsVqoXS22M1uF9bQZxDC917oKMtHSq2xtdnr91NXlrY
	zYR7E0MeN8D3UnnuC72ehIIKUugnZz6IhZN9lAdnGvHA+1GshhirfI8F8+etthVS
	UScFIepHQBCRhOxZbbyMy84KdEoMtP70bKIUvEx20ph5UBXxkFHUweHcHxyTb+7q
	B1qp+w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmce3he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:12:00 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2cba05824so2983928137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 03:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794827519; x=1795432319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ej9jdDHgLV0e8+q224FTssM5bujI8HMl3OobzJU+HSY=;
        b=Z7NolkKN0R0xcPqVhIJDgWE9Yk3NhTWqIxVgMtTUSjcQfvyxK8jvPm1f0M8PzTieBQ
         w+Cgdw/mvBOhopFudFeajqMlDQ2gj17z6LKUL8eQX9Zvs/fdADxrRZQIwF70I9N3BK/n
         /OAGn+32SU4R7jZefT08Q5UbTzn4BcZal258cYDnRHLjr/1lcRY5JXticDOUPDe2/NsO
         BgSEMJ6PL2exF4QOZOuZB4tKqb4v6prQg1Thz1cheKZS5CyYXt12o09uJ0G3xthdCRgN
         tIhAYGeL2fIhXxfcHJj7KOzOlpoa8Zz43Dlwn1sFUYK8k5XxbAVk9QXMSayDo7ZMKMcS
         z93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827519; x=1795432319;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ej9jdDHgLV0e8+q224FTssM5bujI8HMl3OobzJU+HSY=;
        b=dHOOInIG0bd0o57zejDNJpjlJjADjkLR61Og8ccKF6kR/H9zTRaNIeUTeVYZOlE4Pa
         eFkrEjkSObn4WR20Q50p48cRqKdaDxKqT/cDu4S1jEW50uM0CGzHEeBFPvezyLGVG7cJ
         YNcpjHSoUkXsCb1S0flKXWkW+N/LTtnbe0MiPvUqcgPswYCRujrUI/3tvHe5n9dWyzkK
         skOmP19BBKeTQBBW1coWYgXwht0WAqLfmJhMjRcV8EJ2iLrp18r+tbfIUGmF5bWyPn+O
         TwHvoG70tF4nuEQ2QcSbo1FR8IHPWCzkxmXlNRNJbd9KFCbocj2LfClOMEuy2JELPpIs
         VxZg==
X-Gm-Message-State: APuU4Z8HbnL9DbSzEzqPKCHMEa6BbB5j2f4yLnLMafbtm5jtrdZdeQBz
	49ZbZSimW4rY0wjYjnS7azh6DjjE/1BaiIJ1BayjZiWYP0L1kVDagoyOZC/LMECUQw7wuidyvT5
	sx+xqEuDN7b/Qo/vHH8c1nPQuOECkO4I5TdMl831rTVmw+k5y37EZtochhEhpe60JWdINvRjngU
	I+
X-Gm-Gg: AYBFou2w/nBbzF6cXl4Unqfo3Pj6Q76n+kJzGU4Ra/Yt4ldSDi7JJxVsf06SgSmEyTT
	zm767LZAFuxATtxjGzOG8DgQO0WuaaTfkEt3d4mQ1U+oVXc8t1Uk/A3r+YcFNmhGxyJESGL0gR1
	nNPN3nAq19D/KLqwku+elhVdfLRCRtC7LcT2d/nrucfnbh8Q2kVlvcDTqh3Le5D7bdHARWjgYEc
	VGkikjB/yQ5hUyMEmixcm/dLc23u4CutfdK3xhsY9/QHcGoShGtSpSeMqR0NZyJ73zRJN8YREyK
	5xlcOusQ8adsynpErsq62P63F4VA15TkMKe9XJ3XD46lSFoAscgjyz69GW637Nbpx5BzUnnHq+q
	dPNpzLH4XOvyFwA0Tl+DqzzUdT5tT+MIQvyj4YxJm9KwP8cOYjEKynvjLZiCnvEgm+P0FxzSdbF
	Ujk5ft/fBs3RJb8Q==
X-Received: by 2002:a05:6102:4410:b0:7c3:c0b9:9028 with SMTP id ada2fe7eead31-7d64d77b869mr3373683137.24.1794827519621;
        Mon, 16 Nov 2026 03:11:59 -0800 (PST)
X-Received: by 2002:a05:6102:4410:b0:7c3:c0b9:9028 with SMTP id ada2fe7eead31-7d64d77b869mr3373677137.24.1794827519145;
        Mon, 16 Nov 2026 03:11:59 -0800 (PST)
Received: from brgl-qcom.nice.aeroport.fr ([193.57.185.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm390162175e9.4.2026.11.16.03.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:11:58 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/5] gpio: shared: replace platform lookup with dummy software nodes
Date: Mon, 16 Nov 2026 12:11:56 +0100
Message-ID: <179482751351.15583.15760848984534388271.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
References: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfX+pSvMKVii3JD
 oj19BiB9GKtKpZjuWN7wxKqlp05oi7stG9j0wtKT/hPYWdDoWXaMTnfv/qLJByNFf+DViYozpUM
 Uovd/5D6AjgDdqW5riFpkeI0mDZSIQA=
X-Proofpoint-ORIG-GUID: 7Gaz2Wsqk1SHA22t1Cyy7hLyhDFQ7JCi
X-Proofpoint-GUID: 7Gaz2Wsqk1SHA22t1Cyy7hLyhDFQ7JCi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfXx7DbW8Ki5SG5
 jZkzq5zLmHNqd9ZpQVFbz+mKHX6ilzSxwCUoyGVeBAsuB0X44HaTszW1HZpohTfqqu8KNLtgrKu
 wdcKd1Wgc7sUy2V8U8rPVzBny9ubmc+gZY+UxKIU9rbpMjx5J7wBQOhiTd0FghYXWayaARb4baG
 vmGcs/I8V3LaN02uUyYSBMUHTQzeyYm4wi1EDJ4r09pUBJ5KjwusYXJ8L8N/K0Yy+4vnhYz4wD9
 xesPGbgUcoHt2liujRM08o1RYReJHt+LDCHmMYXh9AKXR4FdUJF0QM29oBw+hsWoQ7Izmp7gyZy
 tInAilDJTry+hsFEDdXzWxgGq0GfgrRQ2zKKzO2iQYtYOQG9mOsg3LgM8+L3LfbMGNSjO1SjH0z
 Eg6+JRnJ5S4SrhnvpkjV51fJ7OqL88cWBEFSYhLsNOGYs8Ljt31dpHnHFglzqX5T3y5XcdLLi9z
 gyGAicmV4RxlrGxXaUw==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afae500 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=g6/0voG6I3K7UbaExJZWvQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RChOLZm6GgJo1hU3wOUA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160044


On Wed, 04 Nov 2026 11:38:07 +0100, Bartosz Golaszewski wrote:
> Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
> shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
> for shared GPIOs. With the NULL-pointer dereference now fixed, this is
> a rework that implements support for this use-case.
> 
> Sashiko pointed out several issues under v4. Some of them were bogus and
> I fixed the rest.
> 
> [...]

Applied, thanks!

[1/5] gpio: shared: factor out per-entry teardown helper
      https://git.kernel.org/brgl/c/c402fd2961dd013e2da56cf53d147b4943fc3bec
[2/5] gpio: shared: factor out per-entry setup helper
      https://git.kernel.org/brgl/c/cda42ff53c4b57f56f08de6af7abf280d755bd74
[3/5] gpio: shared: unwind partial failures in gpiochip_setup_shared()
      https://git.kernel.org/brgl/c/6067a8ace266c43eb9514288b76d1d07a0f31eb5
[4/5] gpio: shared: detach the proxy device from struct gpio_shared_ref
      https://git.kernel.org/brgl/c/0b80fc5d424d0926841379c1f190a8d1b2ac360b
[5/5] gpio: shared: convert to using software nodes for GPIO shared proxy lookup
      https://git.kernel.org/brgl/c/23cfadf96e14a32a398975d67ce48f1f59abc253

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
