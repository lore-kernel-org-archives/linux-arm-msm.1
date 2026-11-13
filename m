Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575363;
	b=GF4kyHD3XYcIWMyXe4IYHnlK9DdpxC44hKLKLaDZfJFTxCRFrL2RVWg6E26kFuTDUqng
	 I6suYiqiwRELz6o9+Sv3Xj/AXXiK3rEW/TCLRRDot0dMhaisTPAyfvk9cwTCdNJRc4Yyo
	 X5rpaVoPfHDxc9q8Z624LkDvt+zsL6FhXTyV1XNbjPzBMovxah86gp1CV3m/+ER39uoh+
	 p4hafjxh0IaP+Nb+tySFJ6nfDhyQiPjtdKyx7P4Wzd/8VS6hhWVeSF+4wXDNGn4QAFSM7
	 uNRgv459F4znRlToYmA/+icAHiJqaZHYeWGN05hTCEC0ps8Kqnma2gGnnzPz62z1+3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575363;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=TgkZPDfiJjMh2J8e/Fv34yjDTX8rPL0Qo9+0DabzE0k=;
	b=ugxPtrnaH4SE7cplroTIHnX4n4ol/J7imN4Kos0ux1xEJiaIxtk87v9z3TXYbT6FeP/I
	 hTNYv+Zv1kpxnn5QTjjLt6W8/STEXQvuVRh1vDcXQxioCA4PH8xu0vUlgPdB/8rEHIp2M
	 dpb9+ILJ8jnhNYNcQZXhZaxUdZzMbOR2Ok3u+0PuMKinGCspIri3qJD8Q1oMro+TNHE4A
	 6hmVPwIsnDNW/FyRnKAk8wIs6ITHN8J72H9uz40IIBGcWMOaRJ7VsVYEhPpo6yw1w89At
	 KFDtXRQf15ns/XwRE7p8pvVsQK5sOZ4kU69eCF9qxOSwZWyavzKq5FsZokVFfdq1cQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=NwTvgcSx;
	arc=none smtp.remote-ip=95.215.58.110
Received: from mta1.migadu.com (out-110.mta1.migadu.com [95.215.58.110])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD82606A327
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AD82606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=NwTvgcSx
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=n6h5sbKyK6McEKrI8Ar5CJ+toQhqjA8M6q8V8BhhvW4=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794575360; v=1; x=1795180160;
 b=NwTvgcSxn8AY/+67Sg7b8RjgRni0YoEnbPQBc4O24To2nFZI+ytKa0ofJpRPTyFB9EeHpfmI
 4wsQY7tOPf8QsbAPViKs6kyQygdtrzYZ4xqRkEj99iCNV+LlppDKrrU3vMGmhJllmrUj3JjgBBw
 wdPnOWLkBjMtRCsqR5+tsaXGyfjTRwjowK2ZSy5eeVIRcGa1M1vlPSSgbaeZfumWe0JiRK12wmr
 Dss1LW32CT0P09CjGXidT7Ua00bRbzoT2t1Vm35817v0YW+joxkVsh2g6JIsjbCTwkxY739jMOz
 lNI5nsBPz/8bYUjUJytvfq6l7Kr6xuDduiwgj9xWgQ2bQ==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c0668823f57e9852;
	Fri, 13 Nov 2026 13:09:19 +0000
X-Mizu-Trace-ID: c0668823f57e9852
X-Migadu-Flow: FLOW_OUT
Message-ID: <e2f89f72-be30-495d-99c8-828cd170ce50@packett.cool>
Date: Fri, 13 Nov 2026 10:09:13 -0300
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
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Wire up
 PM6150L LCDB
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
 <20261113-lcdb-enablement-v1-4-1dc40b49ed82@fairphone.com>
 <DMU3O9G3L6PD.2CE9WCHR9LV0J@fairphone.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <DMU3O9G3L6PD.2CE9WCHR9LV0J@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/13/26 9:59 AM, Luca Weiss wrote:
> On Fri Nov 13, 2026 at 9:16 AM CET, Luca Weiss wrote:
>> Since Linux has gained LCDB support now, wire up the LCDB regulators so
>> we can turn them off and on as desired.
> Actually after some more testing with extra patches, it seems that on
> FP4 the touchscreen stays dead after toggling the lcdb regulator, while
> on FP3 it works perfectly fine.
>
> So please ignore this specific patch for now, I will figure out what the
> problem is and re-submit. All the other patches in the series are still
> good to go in!

Your touchscreen needs to be a drm panel follower and/or reference the 
same supplies as well :) Most modern touch controllers are part of the 
same physical DDIC as the actual display side

