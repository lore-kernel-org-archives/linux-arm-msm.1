Received: from mta1.migadu.com (out-8.mta1.migadu.com [95.215.58.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCE62DF717
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 03:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786935900; cv=none; b=S6pNveGuY0HuGRPiHkQgN3z7HL5Duca3C8XKD7BFihEXjDZOna5mmQsFkYhEiHa5vdXr5mMD1j7uSWR7bjY4+02nvt3FAqMAjia/afcVe0FB/WVLubwHr553tbvODrYUhYyBGChF52PFHQqbgkVTbYFidYTbE8M+8UAZnkwS254=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786935900; c=relaxed/simple;
	bh=VhQOgPnrvA2NCGRYj9xaU6hiFrMsO2rrZ8w8XHOrgSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mSj9Nvay8f0aXYWO6ZXN6ipY28DGU9BJ+vVeyiW1dMLKy/cJFhavfjduHma8jxNEuck8UMaqiTZYx2n1eEALeGue99IdkpUcbUkrJiKaO4FovcfUdWGKEhvSqfD/+z9P7MqmDRofbqlIn5SHYAUDZQEFREnlIaBudpB44ZjE6VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bj0WzZYj; arc=none smtp.client-ip=95.215.58.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bj0WzZYj"
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VhQOgPnrvA2NCGRYj9xaU6hiFrMsO2rrZ8w8XHOrgSA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786935896; v=1; x=1787540696;
 b=bj0WzZYjk64NsnUsaceqjcAVLvvsIT12qfp32IcZMD0bxhv/Vk4yJzDKrred5wqq83w4xf49
 Rq0lBUeuRKzMUsiwSzDqFbKGtXxaLVutnz37SszrWXySgIjw7C7E9JXB/jCK/RuQ5KAcj7LwZVO
 EPLJ3bxPviwB7LrIzfvC2rHE=
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: from localhost (2408:84e1:426:d677:802:e2c9:7497:438a)
	by smtp.migadu.com with ESMTPS id 7923081ed4ac32bb;
	Mon, 17 Aug 2026 03:04:56 +0000
X-Migadu-Flow: FLOW_OUT
From: Junjie Cao <junjie.cao@linux.dev>
To: neil.armstrong@linaro.org
Cc: jesszhan0024@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	mitltlatltl@gmail.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] drm/panel: Add support for Novatek NT36532 panel
Date: Mon, 17 Aug 2026 00:03:47 -0500
Message-ID: <20260817050347.300538-1-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804073419.84727-1-junjie.cao@linux.dev>
References: <20260804073419.84727-1-junjie.cao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gentle ping on this series.

Sorry, the "requires DPU support" wording in the cover is a leftover:
that support is already merged (ffa88de8ddb6, ce73a5db44e3) and part
of next-20260727, the base of this series.
