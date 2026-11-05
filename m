Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922890;
	b=AYkXXLniLFhXbBNCW/vnFaiiQwYW5W9Ob6EX3ti1zjzpePLr0AqXwxXooFEgp/B0Xn7J
	 2UIYWZcUX2oLS3unYsgiOahGCCmtDOP5AipeLFgi+ePBmWZ/RRxvFbIalAaWGXCFBJEH+
	 pVQ0JlafGiX+t5WDJtafJqheQUVg/Fekgt/4YQBXmgYsaOkOWOKGwNvMHjaqOVWfahGDU
	 bsDAnfK5XBBEDbll5+sLyNBOSF8jiOH70YD9uO2JFqLkwWM74c3pwosA0ZT6XFLiF8DPu
	 MPbCqouhuQb9ddV8iXbgTkc4Q6ZyvLYw3iqFKX0rxLLE26eQ3X39z60Pf6Krarfmfug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922890;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=gVqx0nYfuSEJ0GdcgxyreyG7706GoUCJZ8KOhEimfQ8=;
	b=Nwasc7j73kN87d7PRDDaC75Xf3ha/j9IEmI+HbmiY8Vz7Z5xvPXhjqAqaZjlm2gOCMeL
	 +4NFtvuApCOftLkNQpyhxt4END+yq2qEw5vyvM6OE1yn1GlkW3GQ28ZMuURRxKBppK/BX
	 X5NrrRXfoaL5X4LDWA2nWigG6+lCcUlxK0dGd+OlHtU7FghyEmzSoBr8V6zrWW6Q7tHui
	 trqf0pzJS4Unw4/6l+GizN69OqtEXe2Peyq7wx3VgSxjTUIIAhrnJUkGUHYVXD4sUPzWa
	 Aax/Og5Fs1poeWoJ3Mh8BptOnRcFayw+Ll9L0LhKrTiiQY/YnZ7ZHmdQM8KE80emaCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=PZgyvCP+;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE2E606A326
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 23:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CE2E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=PZgyvCP+
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id Ow8UxYfsARiNxP7I4xw8tY; Thu, 05 Nov 2026 23:54:45 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id P7I4xgB7Pq5xIP7I4xZuva; Thu, 05 Nov 2026 23:54:44 +0000
X-Authority-Analysis: v=2.4 cv=RayQC0tv c=1 sm=1 tr=0 ts=6aed1744
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=OuZLqq7tAAAA:8
 a=EUspDBNiAAAA:8 a=pYUB3rPNxVkG2UVf4jEA:9 a=CjuIK1q_8ugA:10
 a=AKGiAy9iJ-JzxKVHQNES:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gVqx0nYfuSEJ0GdcgxyreyG7706GoUCJZ8KOhEimfQ8=; b=PZgyvCP+eIup2LALOsc1El6qhX
	BpiSGOeVoHC2LKTSnFsH2qjCv++Q57E0cKLuYoRslbciG/VerYtXhrcuLu1iQUDlnCkWjaWtbDrrx
	RCgrwwIlXJaHXe7c/G/u3uP2rz3Xx7V7sH+/rzip2tA/90KtrTMgb2+8oF5wQHF8TDcMFbmaaaLd7
	JZsTVXOKJ9j2MpzTZU3R8RXdjeRZ1t7tEnvvh8cFihXHNVBUmVxxLkmzUsFkM2I9ijxyWf8HoN/AX
	H1EfrwSIpaqSRJ3fSTLcklPmkgRjlPgCM5N5R9J+ALX+ConkfP2eURYPl5qimFEBtAKnTcwZdPc5R
	9AwVujhg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:60104 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xP7Hz-000000019Yr-1Hb2;
	Fri, 06 Nov 2026 05:24:39 +0530
Date: Thu, 5 Nov 2026 15:54:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-remoteproc@vger.kernel.org, linux-input@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 03/11] dt-bindings: watchdog: qcom-wdt: Document
 MSM8952 watchdog
Message-ID: <f6bee82d-3e64-4e93-90f0-9470a166626f@roeck-us.net>
References: <20261105-msm8952-initial-support-v8-0-311ae8e8f14b@mainlining.org>
 <20261105-msm8952-initial-support-v8-3-311ae8e8f14b@mainlining.org>
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
In-Reply-To: <20261105-msm8952-initial-support-v8-3-311ae8e8f14b@mainlining.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xP7Hz-000000019Yr-1Hb2
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:60104
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 11
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfC0S6RrhG5hG1B8JtFswfNEjgLj08I0mRLayds1p4dYQmbue55pgwf7I6Qu9NXh9q88TWDC/v1WR1dFRg3H0VtkW3eo9WpiBw3NTEK+om2PEHarBKf38
 nrtve62oxR57SktpkbFoJwOsFI4ToTDfv6G63Spu+Rqdign6flMt72TrF3o6OdFV/hq/BQeZ38GnWLYUeO6nhSYCvm7a3Ee/gTXRpJtO661vrXJ44gm3FbOL

On Thu, Nov 05, 2026 at 01:54:07PM +0300, Muzaffer Kadir wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Document the watchdog found on MSM8952.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Applied.

Thanks,
Guenter
